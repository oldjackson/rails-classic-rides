class CarsController < ApplicationController
  action_before :set_car, only [:show, :edit, :update, :destroy]

  def index
    @cars = Cars.all
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

    if @car.save
      redirect to @car
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
      params.require(:car).permit(:make, :model, :year, :description, :price_day, :location, :number_seats)
    end
  end

end
