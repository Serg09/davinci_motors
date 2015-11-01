class CarsController < ApplicationController
  def index
    @cars = Car.all
  end

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)

    if @car.save
      redirect_to root_path,
        :notice => "#{@car.year} #{@car.make} #{@car.model} created"
    else
      # do something
    end
  end

  # def show
  #   @car = Car.find(car_params[:id])
  # end

  private
  def car_params
    params.require(:car).permit([:year, :make, :model, :price])
  end
end
