class AddDefaultsToCars < ActiveRecord::Migration[5.1]
  def change
    change_column :cars, :convertible, :boolean, default: false
    change_column :cars, :driver_left, :boolean, default: true
    change_column :cars, :automatic, :boolean, default: false
    change_column :cars, :chauffeur, :boolean, default: false
  end
end
