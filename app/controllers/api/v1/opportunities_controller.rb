class Api::V1::OpportunitiesController < ApplicationController
  respond_to :json

  def index
    render json: []
  end

  def show
    render json: salesforce_opportunity, serializer: OpportunitySerializer
  end

  def create
    render json: false
  end

  private

  def salesforce_opportunity
    opp = Salesforce::Opportunity.new(id: params[:id])
    Cloud9::Opportunity.new(opp.salesforce_data.to_h)
  end

  def opportunity=

  end

  def opportunity_params
    params.require(:opportunity).permit(:name, :description, :id)
  end
end