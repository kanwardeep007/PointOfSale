class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :name
      t.float :price
      t.boolean :currently_present, :default => true
      t.timestamps
    end
  end
end
