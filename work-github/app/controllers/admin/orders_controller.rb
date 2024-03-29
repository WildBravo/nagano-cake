class Admin::OrdersController < ApplicationController

  def show
      @order = Order.find(params[:id])
     
      @price_all = 0
  end

  def update
       @order = Order.find(params[:id])
       @order_details = OrderDetail.where(order_id: params[:id])
    if @order.update(order_params)

      @order_details.update_all(production_status: "waiting")  if @order.reception_status == "payment_confirmation"

    end
      redirect_to admin_order_path(@order)
  end

  private

   def order_params
     params.require(:order).permit(:reception_status)
   end

end
