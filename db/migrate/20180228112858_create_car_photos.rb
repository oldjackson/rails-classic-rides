class CreateCarPhotos < ActiveRecord::Migration[5.1]
  def change
    create_table :car_photos do |t|
      t.references :car, foreign_key: true
      t.text :caption
      t.string :photo

      t.timestamps
    end
  end
end
