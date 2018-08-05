class BookingsController < ApplicationController
  before_action :user
  before_action :set_car, only: [:create, :edit]
  before_action :set_booking, only: [:decline, :accept]

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = @user
    @booking.car = @car
    if @booking.save
      redirect_to car_path(@car), notice: "Your booking is pending confirmation"
    else
      redirect_to car_path(@car), alert: "The booking could not be accepted"
    end
  end

  def accept
    @booking.status = 'accepted'
    if @booking.save
      redirect_to dashboard_path
    else
      redirect_to dashboard_path, alert: "The booking could not be accepted"
    end
  end

  def decline
    @booking.status ='declined'
    if @booking.save
      redirect_to dashboard_path
    else
      redirect_to dashboard_path, alert: "The booking could not be declined"
    end
  end

  private

  def user
    @user = current_user
  end

  def set_car
    @car = Car.find(params[:car_id])
  end

  def set_booking
    @booking = Booking.find(params[:id])
    if @booking.car.user != current_user
      redirect_to dashboard_path, alert: "The booking you are trying to alter was not placed on any of your cars."
    end
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :total_price, :car_id)
  end
end
