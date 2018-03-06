class Api::V1::ModelsController < ApplicationController
  before_action :set_model, only: [:show, :update, :destroy]

  def index
    render json: Model.all
  end

  def show
    render json: @model
  end

  def create
    model = Model.new(model_params)

    if model.save!
      render json: model
    else
      render json: model.errors, status: 400
    end

  end

  def update
    if @model.update(model_params)
      head :no_content
    else
      render json: @model.errors, status: 400
    end
  end

  def destroy
    if @model.destroy
      head :no_content
    else
      render json: @model.errors, status: 400
    end
  end

  private

    def model_params
      params.require(:model).permit(:name, :base_price, :style)
    end

    def set_model
      @model = Model.find(params[:id])
    end
end
