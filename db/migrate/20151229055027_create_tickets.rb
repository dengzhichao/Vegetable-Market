class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.integer :number
      t.integer :vote

      t.timestamps
    end
  end
end
