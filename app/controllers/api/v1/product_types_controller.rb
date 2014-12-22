class Api::V1::ProductTypesController < ApplicationController
  respond_to :json

  def index
    render json: Cloud9::ProductType.all
  end

  def show
    render json: Cloud9::ProductType.find(params[:id])
  end

end