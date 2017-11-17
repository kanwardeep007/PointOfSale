class BillsController < ApplicationController
  def create
    if params[:bill].present?
      @bill = Bill.new(bill_params)
      if @bill.save
        @bill.save_cost
        flash[:notice] =  "Bill Created Succesfully"
        redirect_to @bill
      else
        flash[:alert] =  "Invalid quantity "
        redirect_to new_bill_path
      end
    else
      flash[:alert] = "Please add order to Bill"
      redirect_to new_bill_path
    end
  end

  def show
    @bill = Bill.find(params[:id])
  end

  def new
    @bill = Bill.new
    @items = Item.all.collect {|p| [ p.name, p.id]}
  end

  def search
    @id = params[:hidden_value_id]
    @name = params[:hidden_value_name]
    @quantity_2 =  params[:hidden_value_quantity_2]
    @destroy_1 = params[:hidden_value_destroy_1]
    @quantity_1 = Bill.quantity_field(@id)
    @destroy_2 = Bill.destroy_field(@id)
    @items = Bill.searched_items_by_tags(params[:search])
  end
  def index
    @bill = Bill.find_by_id(params[:id])
    if @bill.present?
      render 'show.html.erb'
    else
      flash[:alert] = "Cant find bill number"
      redirect_to root_path
    end
  end

  private
  def bill_params
    params.require(:bill).permit(:quantity,orders_attributes: [:quantity,:item_id])
  end
end
