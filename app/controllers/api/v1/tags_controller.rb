class Api::V1::TagsController < ApplicationController
  before_action :authenticate_developer
  before_action :authenticate_creator, only: [:create, :destroy]
  before_action :pagination
  before_action :set_tag, only: [:show, :destroy]

  def index
    if coffeehouse_is_present?
      set_coffeehouse
      render json: @coffeehouse.tags.limit(@limit).offset(@offset)
    else
      render json: Tag.all.limit(@limit).offset(@offset)
    end
  end

  def show
    render json: @tag
  end

  def create
    tag = Tag.find_by_name(tag_params['name'])
    coffeehouse = Coffeehouse.find(params[:coffeehouse_id])
    if tag.nil?
      tag = Tag.new(tag_params)
      if tag.save
        render json: tag, status: :created
      else
        render json: tag.errors, status: :unprocessable_entity
      end
    end
    coffeehouse.tags << tag
    render json: tag, status: :created
  end


  def destroy
    @tag.destroy
    head :no_content
  end

  def coffeehouses
    set_tag
    render json: @tag.coffeehouses
  end

  private
  #TODO: This should be in a helper, uses this exact function in multiple classes
  def set_coffeehouse
    @coffeehouse = Coffeehouse.find(params[:coffeehouse_id])

      # if the coffeehouse is not found
  rescue ActiveRecord::RecordNotFound
    error = Error.new
    # tell the user what went wrong and give statuscode 404
    render json: error.resource_not_found("coffeehouses/#{params[:id]}"), status: :not_found
  end

  def set_tag
    @tag = Tag.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    error = Error.new
    # tell the user what went wrong and give statuscode 404
    render json: error.resource_not_found("tags/#{params[:id]}"), status: :not_found
  end

  def tag_params
    params.permit(:name)
  end

  def coffeehouse_is_present?
    params[:coffeehouse_id].present?
  end
end
