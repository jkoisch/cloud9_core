class ProductsController < ApplicationController

  respond_to :json

  def index
    respond_with Product.all
  end

  private
  def product_params
    params.require(:product).permit(:name, :description, :id)
  end

end