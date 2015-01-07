class ProductsController < ApplicationController

  def index
    @cloud9_products = Cloud9::Product.all
  end

  def show
    @cloud9_product = product
  end

  def create
    respond_with Cloud9::Product.create(product_params)
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
    params.require(:product).permit(:name, :active, :description, :notes, :status, :invoice_name,
                                    :invoice_description, :product_type_id, :required_quantity,:unit_price)
  end

end