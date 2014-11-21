class Api::V1::CostsController < ApplicationController
  respond_to :json

  def index
    render json: costs
  end

  private

  def costs
    Cloud9::Cost.where(product_id: params[:product_id])
  end
end