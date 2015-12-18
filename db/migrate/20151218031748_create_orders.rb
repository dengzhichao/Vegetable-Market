class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.integer :order_status_id
      t.timestamp :shipped_at
      t.string :traceable_number

      t.timestamps
    end
  end
end
