class OpportunitiesController < ApplicationController

  respond_to :json

  def index
  end

  def salesforce_index
    opp_array = []

  end

  private
  def product_params
    params.require(:product).permit(:name, :description, :id)
  end

end