class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :ename
      t.string :jname

      t.timestamps
    end
  end
end
