class Api::V1::CustomersController < ApplicationController
  respond_to :json

  def index
    render json: Cloud9::Customer.all
  end

  def show
    render json: customer
  end

  def create
    respond_with :api, :v1, Cloud9::Customer.create(customer_params)
  end

  def update
    respond_with product.update(product_params)
  end

  def destroy
    respond_with product.destroy
  end

  private

  def customer
    Cloud9::Customer.find(params[:id])
  end

  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :organization_name, :email, :role, :id)
  end
end