class CreateBills < ActiveRecord::Migration[5.1]
  def change
    create_table :bills do |t|
      t.float :sale_price
      t.float :final_price
      t.timestamps
    end
  end
end
