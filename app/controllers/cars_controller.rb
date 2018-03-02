class CarsController < ApplicationController
  before_action :set_car, only: [:show, :edit, :update, :destroy]


  def index
    cars = params[:search].nil? || params[:search].strip.empty? ? Car.all : Car.search(params[:search])
    @cars = cars.reject{ |car| car.user == current_user }
  end

  def show
  end

  def new
    if user_signed_in?
      @car = Car.new
    else
      redirect_to cars_path, alert: "To post a new car for renting you need to sign in."
    end
  end

  def edit
  end

  def create
    @car = Car.new(car_params)
    @car.user = current_user
    if @car.save
      redirect_to car_path(@car)
    else
      render :new
    end
  end

  def update
    if @car.update(car_params)
      redirect_to @car
    else
      render :edit
    end
  end

  def destroy
    @car.destroy
    redirect_to cars_path
  end

  private

  def set_car
    @car = Car.find(params[:id])
  end

  def car_params
    params.require(:car).permit(:make, :model, :year, :description, :price_day, :location, :number_seats, car_photos_attributes: [:id, :photo, :photo_cache, :_destroy])
  end


end
