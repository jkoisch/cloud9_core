require 'rails_helper'

RSpec.describe Invoicing, :type => :model do
  before(:all) do
    @cust = create(:customer_with_non_system_components)
    @service = Invoicing.new(@cust)
    @invoice = @service.call
  end

  it "has customer information available" do
    customer = @invoice.customer
    expect(customer.organization_name).to eq('Organization')
  end

  it "reflects groups of invoice items" do
    expect(@invoice.invoice_groups.length).to be > 0
    @invoice.invoice_groups.each do |group|
      #expect(group.total).to be > 0
      expect(group.total.is_a?(Integer)).to eq(true)
    end
  end

  it "has a total price" do
    expect(@invoice.total).to be > 0
    expect(@invoice.total.is_a?(Integer)).to eq(true)
  end

  it "reflects prices of components that are not attached to any system" do
    expect(@invoice.components.length).to be > 0
    expect(@invoice.components[0].is_a?(Cloud9::Component)).to eq(true)
  end

  it "reflects prices of components that are in fact attached to a system" do
    expect(@invoice.systems.length).to be > 0
    expect(@invoice.systems[0].is_a?(Cloud9::System)).to eq(true)
    expect(@invoice.systems[0].virtual_machine_identifier).to eq("system_1")
  end

end