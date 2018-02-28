class CarsController < ApplicationController
  before_action :set_car, only: [:show, :edit, :update, :destroy]

  # def index
  #   @cars = Car.all
  def index
    make_cars = Car.all
    model_cars = Car.all
    location_cars = Car.all

    if params[:make]
      make_cars = Car.where('LOWER(make) LIKE LOWER(?)', "%#{params[:make]}%")
    end
    if params[:model]
      model_cars = Car.where('LOWER(model) LIKE LOWER(?)', "%#{params[:model]}%")
    end
    if params[:location]
      location_cars = Car.where('LOWER(location) LIKE LOWER(?)', "%#{params[:location]}%")
    end

    @cars = make_cars & model_cars & location_cars

  end

  def show
  end

  def new
    @car = Car.new
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
    redirect_to cars
  end

  private

  def set_car
    @car = Car.find(params[:id])
  end

  def car_params
    params.require(:car).permit(:make, :model, :year, :description, :price_day, :location, :number_seats, :photo)
  end


end
