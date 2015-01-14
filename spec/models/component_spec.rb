
require 'rails_helper'

RSpec.describe Cloud9::Component, :type => :model do

  it "supports a product's required quantity" do

    prod = create(:product_with_required_quantity)
    comp = create(:component)

    expect(comp.valid?).to be(true)
    expect(comp.quantity.nil?).to be(true)
    comp.product = prod
    comp.check_product_quantity
    comp.save
    expect(comp.quantity).to eq(prod.required_quantity)

  end

end