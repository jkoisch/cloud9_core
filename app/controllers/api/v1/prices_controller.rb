class Api::V1::PricesController < ApplicationController
  respond_to :json

  def index
    render json: prices
  end

  def create
    p = Cloud9::Price.create(active: price_params[:active], product_id: price_params[:product_id], amount:
                                     price_params[:amount])
    activate_price p
    render json: p
  end

  private

  def price_params
    params.require(:price).permit(:active, :id, :amount, :product_id)
  end

  def price
    Cloud9::Price.find(params[:id])
  end

  def activate_price(_price)
    _price.product.activate_price(_price)
  end
end