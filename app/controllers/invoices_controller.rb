class InvoicesController
  # Type stuff here

  def show
    @opportunity = SalesForce::Opportunity.new(:id => params[:id])

  end
end