class Item < ApplicationRecord

  has_many :cart_items
  has_many :order_details
  belongs_to :genre
  has_one_attached :image


  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no.jpeg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end

  def with_tax_price
    (price * 1.1).floor
  end

  def self.looks(search, word)
    if search == "完全一致"
      @item = Item.where("name LIKE?", "#{word}")
    else
      @item = Item.all
    end
  end

end
