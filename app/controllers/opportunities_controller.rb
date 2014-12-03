class OpportunitiesController < ApplicationController
  respond_to :json

  def index
    render json: []
  end

  def show
    @it = opportunity
    p @it.to_s
    render json: @it
  end

  def create
    render json: false
  end

  private

  def opportunity
    opp = Salesforce::Opportunity.new(id: params[:id])
    Cloud9::Opportunity.new(opp.salesforce_data.to_h)
  end

  def opportunity=

  end

  def opportunity_params
    params.require(:opportunity).permit(:name, :description, :id)
  end

end