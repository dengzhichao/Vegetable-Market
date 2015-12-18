class CreateOrderStatuses < ActiveRecord::Migration
  def change
    create_table :order_statuses do |t|
      t.string :s
      t.string :c

      t.timestamps
    end
  end
end
