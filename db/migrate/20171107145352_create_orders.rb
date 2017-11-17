class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.integer :bill_id
      t.integer :item_id
      t.integer :quantity
      t.float :sale_price
      t.float :final_price
      t.timestamps
    end
  end
end
