class CreateBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :bookings do |t|
      t.references :user, foreign_key: true
      t.references :car, foreign_key: true
      t.date :start_date
      t.date :end_date
      t.float :total_price
      t.string :status, default: "pending"

      t.timestamps
    end
  end
end
