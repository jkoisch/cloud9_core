require 'rails_helper'

RSpec.describe Cloud9::Customer, :type => :model do

  it "has an organization name" do
    cust = create(:customer)
    expect(cust.organization_name).to eq('Organization')
  end

  it "has contacts associated with it" do
    cust = create(:customer_with_contacts)
    expect(cust.contacts.length).to eq(5)
    expect(cust.contacts[0].email).to eq("john.doe@johndoes.com")
  end

  it "has systems attached to it" do
    cust = create(:customer_with_systems)
    expect(cust.systems.count).to eq(5)
  end

  it "has components by virtue of having systems" do
    cust = create(:customer_with_systems)
    expect(cust.components.count).to eq(15)
  end

  it "can have sets of components based on systems and standalone components" do
    @cust = create(:customer_with_non_system_components)
    expect(@cust.components.count).to eq(20)
    expect(@cust.non_system_components.count).to eq(5)
  end

  it "can have components" do
    @cust = create(:customer_with_non_system_components)
    expect(@cust.non_system_components[0].is_a?(Cloud9::Component)).to be(true)
  end


end