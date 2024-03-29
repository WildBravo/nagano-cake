class Public::SearchesController < ApplicationController
  def search
    @range = params[:range]

    if @range == "Item"
      @items = Item.looks(params[:search], params[:word])
    else
      @genres = Genre.looks(params[:search], params[:word])
    end
  end
end
