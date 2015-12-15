class AddPhotoToMerchandise < ActiveRecord::Migration
  def change
    add_column :merchandises, :photo, :binary
    add_column :merchandises, :file_name, :string
    add_column :merchandises, :file_type, :string
  end
end
