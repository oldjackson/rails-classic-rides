class Car < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :car_photos

  validates :make, presence: true
  validates :model, presence: true
  validates :year, presence: true
  validates :description, presence: true
  validates :price_day, presence: true
  validates :location, presence: true
  validates :number_seats, presence: true, inclusion: {in: [2,3,4,5,6]}
  validates :cover_photo, numericality: { greater_than: -1}

  include PgSearch
  pg_search_scope :search,
    against: [ :make, :model, :location ],
    using: {
      tsearch: { prefix: true }
    }
end
