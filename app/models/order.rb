class Order < ApplicationRecord
  belongs_to :item
  belongs_to :bill
  validates :quantity, numericality: {greater_than_or_equal_to: 1}
  # validates :sale_price, numericality: {greater_than_or_equal_to: 0}
  # validates :final_price, numericality: {greater_than_or_equal_to: 0}
  # virtual field item_name (getter method)
  def item_name
      Item.find_by(id: self.item_id).name if self.item_id.present?
  end

  # virtual field item_name (setter method)
  def item_name=(name)
    self.item_id = Item.find_by(name: name).id if name.present?
  end

end
