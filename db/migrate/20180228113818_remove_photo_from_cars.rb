class RemovePhotoFromCars < ActiveRecord::Migration[5.1]
  def change
    remove_column :cars, :photo, :string
    add_column :cars, :cover_photo, :integer, default: 0
  end
end
