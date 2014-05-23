class Api::CampersController < ApplicationController
  def index
    render json: Camper.all
  end

  def show
    render json: Camper.find(params[:id])
    
  end
end
