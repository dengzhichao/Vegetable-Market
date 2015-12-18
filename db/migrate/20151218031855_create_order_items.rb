class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.integer :order_id
      t.integer :merchandise_id
      t.integer :price
      t.integer :number_of_items

      t.timestamps
    end
  end
end
