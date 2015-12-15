class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.integer :user_id
      t.integer :merchandise_id
      t.integer :number_of_items

      t.timestamps
    end
  end
end
