require 'rails_helper'

RSpec.describe Invoicing, :type => :model do
  before(:all) do
    @cust = create(:customer_with_spare_components)
    @invoice = Invoicing.new(@cust)
  end

  it "has customer information available" do
    invoice = @cust.last_sent_invoice
  end

  it "reflects prices of systems" do

  end

  it "reflects prices of components that are not attached to any  system" do

  end

  it "reflects one or more orders for a customer" do

  end

end