class CarsController < ApplicationController
  # before_action :set_car, only: [:show]
  before_action :set_car, only: [:edit, :update]

  def index
    @cars = Car.all
  end

  def show
    @car = Car.find(params[:id])
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

  def edit
    @car = Car.find(params[:id])
  end

  def update
    @car = Car.find(params[:id])
    respond_to do |format|
      if @car.update(car_params)
        format.html { redirect_to cars_path, notice: 'Car was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @car = Car.find(params[:id])
    @car.destroy
    respond_to do |format|
      format.html { redirect_to cars_path, notice: 'Car was successfully deleted.' }
    end
  end

  private
  def car_params
    params.require(:car).permit([:year, :make, :model, :price])
  end

  def set_car
    @car = Car.find(params[:id])
  end
end
