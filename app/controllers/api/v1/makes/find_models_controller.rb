class Api::V1::Makes::FindModelsController < ApplicationController

  def index
    render json: Model.where(make_id: params[:id])
  end
  
end
