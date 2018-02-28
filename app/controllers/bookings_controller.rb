class BookingsController < ApplicationController
  before_action :set_car, only: [:create, :edit]
  before_action :user
  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = @user
    @booking.car = @car
    if @booking.save
      redirect_to car_path(@car)
    else
      render :new
    end
  end

  private

  def user
    @user = current_user
  end

  def set_car
    @car = Car.find(params[:car_id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :total_price, :car_id)
  end
end
