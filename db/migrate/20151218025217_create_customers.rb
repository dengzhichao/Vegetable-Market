class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.integer :user_id
      t.string :name
      t.string :zipcode
      t.string :street_address
      t.string :city
      t.string :phone

      t.timestamps
    end
  end
end
