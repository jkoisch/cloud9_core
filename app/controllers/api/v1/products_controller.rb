class Api::V1::ProductsController < ApplicationController
  respond_to :json

  def index
    render json: Cloud9::Product.includes(:product_costs).all
  end

  def show
    respond_with product
  end

  def create
    respond_with :api, :v1, Cloud9::Product.create(product_params)
  end

  def update
    respond_with product.update(product_params)
  end

  def destroy
    respond_with product.destroy
  end

  private

  def product
    Cloud9::Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :description, :cost, :price)
  end


end