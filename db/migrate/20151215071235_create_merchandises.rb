class CreateMerchandises < ActiveRecord::Migration
  def change
    create_table :merchandises do |t|
      t.string :category
      t.string :name
      t.integer :price
      t.integer :max_order

      t.timestamps
    end
  end
end
