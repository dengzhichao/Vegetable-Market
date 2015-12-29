class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :number
      t.integer :security

      t.timestamps
    end
  end
end
