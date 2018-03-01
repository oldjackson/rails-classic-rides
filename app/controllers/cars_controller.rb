class CarsController < ApplicationController
  before_action :set_car, only: [:show, :edit, :update, :destroy]


  def index
    # @cars = params[:search].nil? || params[:search].strip.empty? ? Car.all : Car.search(params[:search])
    @cars = Car.where.not(latitude: nil, longitude: nil)

    @markers = @cars.map do |car|
      {
        lat: car.latitude,
        lng: car.longitude#,
        # infoWindow: { content: render_to_string(partial: "/flats/map_box", locals: { flat: flat }) }
      }
    end
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
