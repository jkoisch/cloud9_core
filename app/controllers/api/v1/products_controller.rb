class Api::V1::ProductsController < ApplicationController
  respond_to :json

  def index
    render json: Cloud9::Product.all
  end

  def show
    render json: product
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
    params.require(:product).permit(:name, :active, :description, :notes, :status, :invoice_name, :invoice_description, :product_type_id)
  end


end