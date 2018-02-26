class CreateCars < ActiveRecord::Migration[5.1]
  def change
    create_table :cars do |t|
      t.string :make
      t.string :model
      t.integer :year
      t.text :description
      t.integer :number_seats
      t.boolean :convertible
      t.integer :price_day
      t.boolean :driver_left
      t.boolean :automatic
      t.boolean :chauffeur
      t.string :location


      t.timestamps
    end
  end
end
