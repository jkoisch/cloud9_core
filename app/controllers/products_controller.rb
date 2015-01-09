class ProductsController < ApplicationController

  def index
    @cloud9_products = Cloud9::Product.all
  end

  def edit
    @cloud9_product = product
  end

  def create
    respond_with Cloud9::Product.create(product_params)
  end

  def update
    redirect_to products_path if product.update(product_params)
  end

  def destroy
    respond_with product.destroy
  end

  def prices
    @cloud9_product = product

  end

  private

  def product
    Cloud9::Product.find(params[:id])
  end

  def product_params
    params.require(:cloud9_product).permit(:name, :active, :description, :notes, :status, :invoice_name,:invoice_description, :product_type_id, :required_quantity, :unit_price,:active_price)
  end

end