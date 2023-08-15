class PlantsController < ApplicationController

  # GET /plants
  def index
    plants = Plant.all
    render json: plants
  end

  # GET /plants/:id
  def show
    plant = Plant.find_by(id: params[:id])
    render json: plant
  end

  # POST /plants
  def create
    plant = Plant.create(plant_params)
    render json: plant, status: :created
  end

  private

  def plant_params
    params.permit(:name, :image, :price, :is_in_stock)
  end

  def update
    @plant = Plant.find(params[:id])
  
    if @plant.update(plant_params)
      render :show
    else
      render :edit
    end
  end  
  
  def destroy
    @plant = Plant.find(params[:id])
    @plant.destroy
  
    head :no_content
  end
  
  
end
