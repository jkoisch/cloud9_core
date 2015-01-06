class Api::V1::InvoicesController < ApplicationController
  respond_to :json

  def index
    render json: invoices
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

  def invoice
    Cloud9::Cost.find(params[:id])
  end

  def sample

  end
end