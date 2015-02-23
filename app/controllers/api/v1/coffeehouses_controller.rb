class Api::V1::CoffeehousesController < ApplicationController
  #before_action :authenticate_developer
  before_action :authenticate_creator
  before_action :pagination
  before_action :set_coffeehouse, only: [:show, :update, :destroy]


  def index
    if params[:creator_id].present? && params[:search].present?
      match_creators_coffeehouses
    elsif params[:creator_id].present?
      creators_coffeehouses
    elsif params[:search].present?
      match_coffeehouses
    else
      coffeehouses
    end

  end

  def coffeehouses
    if params[:order].present?
      coffeehouses = Coffeehouse.limit(@limit).offset(@offset).order("updated_at #{params[:order]}")
      render json: coffeehouses, status: :ok
    else
      coffeehouses = Coffeehouse.limit(@limit).offset(@offset)
      render json: coffeehouses, status: :ok
    end
  end

  def match_creators_coffeehouses
    set_creator
    if params[:order].present?
      coffeehouses = @creator.coffeehouses.limit(@limit).offset(@offset).where('name like ?', "%#{params[:search]}%").
          order("updated_at #{params[:order]}")
      render json: coffeehouses, status: :ok
    else
      coffeehouses = @creator.coffeehouses.limit(@limit).offset(@offset).where('name like ?', "%#{params[:search]}%").
          order("updated_at #{params[:order]}")
      render json: coffeehouses, status: :ok
    end

    render json: coffeehouses, status: :ok
  end

  def match_coffeehouses
    if params[:order].present?
      coffeehouses = Coffeehouse.limit(@limit).offset(@offset).where('name like ?', "%#{params[:search]}%")
      render json: coffeehouses, status: :ok
    else

    end



  end

  def creators_coffeehouses
    set_creator
    if params[:order].present?
      render json: @creator.coffeehouses.limit(@limit).offset(@offset), status: :ok
    else

    end
    render json: @creator.coffeehouses.limit(@limit).offset(@offset), status: :ok
  end

  def show
    render json: @coffeehouse
  end

  def create
    coffeehouse = Coffeehouse.new(coffeehouse_params)
    coffeehouse.creator_id = @creator_id
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
    error = Error.new
    # tell the user what went wrong and give statuscode 404
    render json: error.resource_not_found("coffeehouses/#{params[:id]}"), status: :not_found
  end

  def set_creator
    @creator = Creator.find(params[:creator_id])

  rescue ActiveRecord::RecordNotFound
    error = Error.new
    # tell the user what went wrong and give statuscode 404
    render json: error.resource_not_found("creators/#{params[:creator_id]}/coffeehouses"), status: :not_found
  end

  def coffeehouse_params
    params.require(:coffeehouse).permit(:creator_id, :name, :latitude, :longitude, tags_attributes: [:name] )
  end

  def creator_id

  end

end
