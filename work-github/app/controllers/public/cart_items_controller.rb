class Public::CartItemsController < ApplicationController

  def index
    @cart_items = CartItem.all
    @price_all = 0
  end

  def create

    @cart_item = CartItem.new(cart_item_params)
    @cart_item.save
    redirect_to cart_items_path
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end

  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    #CartItem.destroy_all
    #cart_item = CartItem.all
    current_customer.cart_items.destroy_all
    #cart_item.destroy
    redirect_to cart_items_path
  end


  private

  def cart_item_params
      params.require(:cart_item).permit(:item_id, :customer_id, :volume)
  end

end