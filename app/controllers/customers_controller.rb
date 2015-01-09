class CustomersController < ApplicationController

  def index
    @cloud9_customers = Cloud9::Customer.all
  end

  def show
    @cloud9_customer = customer
  end

  def create
    respond_with :api, :v1, Cloud9::Customer.create(customer_params)
  end

  #The only information that we can update about the customer on this system is products purchased or owned
  def update
    @customer = customer
    @customer.add_non_system_components(customer_params[:components])
    redirect_to customer_path(@customer)
  end

  def destroy
    respond_with product.destroy
  end

  def simulate_invoice
    @cloud9_customer = customer
    sim = Invoicing.new(@cloud9_customer)
    @invoice = sim.sample
  end

  def create_invoice
    @cloud9_customer = customer
    sim = Invoicing.new(@cloud9_customer)
    @invoice = sim.create

    redirect_to customer_path(@cloud9_customer)
  end

  def component
    @cloud9_customer = customer
    @cloud9_products = Cloud9::Product.where("unit_price = false OR unit_price IS NULL")
  end

  private

  def customer
    Cloud9::Customer.find(params[:id])
  end

  def customer_params
    params.require(:cloud9_customer).permit(:first_name, :last_name, :organization_name, :email, :role, :id, :components => [])
  end
end