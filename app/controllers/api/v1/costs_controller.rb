class Api::V1::CostsController < ApplicationController
  respond_to :json

  def index
    render json: costs
  end

  def create
    c = Cloud9::Cost.create(cost_params)
    activate_cost c
    render json: c
  end

  private

  def cost_params
    params.require(:cost).permit(:active, :id, :amount, :product_id, :activate_date)
  end

  def cost
    Cloud9::Cost.find(params[:id])
  end

  def activate_cost(_cost)
    _cost.product.activate_cost(_cost)
  end
end