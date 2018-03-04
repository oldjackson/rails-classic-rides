class Car < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :car_photos, dependent: :destroy

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

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
  accepts_nested_attributes_for :car_photos, reject_if: :all_blank, allow_destroy: true

  def next_booking
    return nil if bookings.empty?

    future_bookings = bookings.select{ |b| b.start_date >= Date.today }
    future_bookings.min_by do |b|
      b.start_date
    end
  end
end
