class HomepageController < ApplicationController
  def newItem
    @item = Item.new
  end
end
