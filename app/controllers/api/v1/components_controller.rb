class Api::V1::ComponentsController < ApplicationController
  respond_to :json

  def index
    render json: Cloud9::Component.all
  end

  def show
    render json: component
  end

  private

  def component
    Cloud9::Component.find(params[:id])
  end

  def product_params
    params.require(:component).permit(:id, :product_id, :notes, :system_id, :active, :quantity)
  end
end
