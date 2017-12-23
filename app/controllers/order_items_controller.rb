class OrderItemsController < ApplicationController

  def create
    @order = current_order
    @item = @order.order_items.new(item_params)
    if @order.save
      @message = "Item added to Cart!"
      session[:order_id] = @order.id
      flash[:notice] = @message
    else
      @message = @item.errors.full_messages
      flash[:alert] = @message
    end
    redirect_to books_path
  end

  def update
    @order = current_order
    @item = @order.order_items.find(params[:id])
    @item.update_attributes(item_params)
    @order.save
  end

  def destroy
    @order = current_order
    @item = @order.order_items.find(params[:id])
    @item.destroy
    @order.save
    redirect_to cart_path
  end

  private

  def item_params
    params.require(:order_item).permit(:quantity, :book_id)
  end
end
