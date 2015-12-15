class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.integer :role_id, default: 3
      t.string :handle

      t.timestamps null: false
    end
  end
end
