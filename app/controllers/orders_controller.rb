class OrdersController < ApplicationController
  def create
    @bill = Bill.find_by(id: params[:hidden_bill_id])
    @item = Item.find_by(name: params[:order][:item_name]) if params[:order][:item_name].present?
    @order = @bill.orders.new(item_id:@item.id,quantity: params[:order][:quantity]);
    if(@order.save)
      redirect_to action: "new",billId: @bill.id
    else
    end
  end
end
