
require 'rails_helper'

RSpec.describe Cloud9::Component, :type => :model do

  it "supports a product's required quantity" do

    prod = create(:product_with_required_quantity)
    comp = create(:component)

    comp.quantity = 300
    expect(comp.quantity).to eq(300)

    comp.product_id = prod.id
    comp.save

    expect(comp.quantity).not_to eq(300)
    expect(comp.quantity).to eq(prod.required_quantity)

  end

end