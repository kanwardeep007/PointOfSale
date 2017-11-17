class ItemsController < ApplicationController
  def new
    @item = Item.new
  end
  def create
    @item = Item.new(item_params)
    if @item.item_present?(@item.name)
      flash[:alert] = "This item already exists! "
      redirect_to new_item_path
    elsif @item.save
      flash[:notice] = "Item Creation Succesfully"
      redirect_to root_path
    else
      render new_item_path
    end
  end
  
  private
  def item_params
    params.require(:item).permit(:name, :price, :all_tags)
  end
end
