class Bill < ApplicationRecord
  has_many :orders
  accepts_nested_attributes_for :orders, allow_destroy: true
  after_create :add_prices
  # validates :sale_price, numericality: {greater_than_or_equal_to: 0}
  # validates :final_price, numericality: {greater_than_or_equal_to: 0}

  # function to store prices of orders
  def add_prices
      self.orders.each do |order|
        if(order.quantity.present?)
          sale_price = order.item.price * order.quantity
          order.sale_price = sale_price
          order.final_price = sale_price * 1.18
          order.save
        end
      end
  end

  # Search items given by the tags (finding all items which have atleast 1 of these tags)
  def self.searched_items_by_tags(str)
    items = Array.new
    if(str.blank?)
      items = Item.all.collect {|p| [ p.name, p.id]}
    else
      arr = str.split(',')
      arr.each do |name|
        items += Tag.find_by_name(name.capitalize).items.collect{|p| [p.name,p.id]}
      end
    end
    items.uniq
  end

  # quantity_field helping in making the form for order for a particular bill
  def self.quantity_field(str)
    arr = str.split('_')
    arr.delete_at(-1)
    arr.delete_at(-1)
    arr.insert(-1,"quantity")
    return arr.join('_')
  end

  # destroy_field helping in making the form for order for a particular bill
  def self.destroy_field(str)
    arr = str.split('_')
    arr.delete_at(-1)
    arr.delete_at(-1)
    arr.insert(-1,"_destroy")
    return arr.join('_')
  end

  # saving the price for the bill
  def save_cost
    self.update_attribute(:sale_price,self.orders.sum(:sale_price).ceil)
    self.update_attribute(:final_price,self.orders.sum(:final_price).ceil)
  end
end
