class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :car

  validates :start_date, presence: true
  validates :end_date, presence: true
  validate :start_date_cannot_be_in_the_past,
    :end_date_cannot_be_before_start_date
  validates :status, inclusion: {in: %w(pending accepted declined ongoing completed)}

  validates :total_price, presence: true, numericality: { greater_than: 0}

  private

  def start_date_cannot_be_in_the_past
    if start_date < Date.today
      errors.add(:start_date, "can't be in the past")
    end
  end

  def end_date_cannot_be_before_start_date
    if end_date < start_date
      errors.add(:end_date, "can't be before start date")
    end
  end
end
