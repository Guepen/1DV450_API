class Api::V1::CoffeehousesController < ApplicationController
  before_action :set_coffeehouse, only: [:show, :update, :destroy]

  def index
    coffeehouses = Coffeehouse.all
    #TODO: add pagination? filtering? orderBy?
    render json: coffeehouses
  end

  def show
    render json: @coffeehouse
  end

  def create
    coffeehouse = Coffeehouse.new(coffeehouse_params)
    if coffeehouse.save
      render json: coffeehouse, status: :created
    else
      render json: coffeehouse.errors, status: :unprocessable_entity
    end
  end

  def update
    if @coffeehouse.update(coffeehouse_params)
      head :no_content
    else
      render json: @coffeehouse.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @coffeehouse.destroy
    head :no_content
  end

  # Private methods
  private

  def set_coffeehouse
    @coffeehouse = Coffeehouse.find(params[:id])

      # if the coffeehouse is not found
  rescue ActiveRecord::RecordNotFound
    error = ErrorMessage.new
    # tell the user what went wrong and give statuscode 404
    render json: error.resource_not_found("coffeehouses/#{params[:id]}"), status: :not_found
  end

  def coffeehouse_params
    params.require(:coffeehouse).permit(:creator_id, :name, :lat, :long)
  end
end