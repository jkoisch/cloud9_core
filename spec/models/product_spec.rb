# == Schema Information
#
# Table name: products
#
#  id                  :integer          not null, primary key
#  name                :string(255)
#  description         :text
#  invoice_name        :string(255)
#  invoice_description :text
#  product_type_id     :integer
#  active              :boolean
#  created_at          :datetime
#  updated_at          :datetime
#

require 'rails_helper'

RSpec.describe Cloud9::Product, :type => :model do
  it "has a name and description" do
    prod = build(:product)

    expect(prod.valid?).to eq(true)
    expect(prod.name.is_a?(String)).to eq(true)
    expect(prod.description.is_a?(String)).to eq(true)
    expect(prod.name).to eq('product_1')
    expect(prod.description).to eq('product_1 description')
  end

  it "gets the defaults set for invoice items" do
    prod = create(:product)

    expect(prod.invoice_name.blank?).to eq(false)
    expect(prod.invoice_description.blank?).to eq(false)
  end

  it "can represent an instance of a product type" do
    pt = create(:product_type)
    prod = create(:product, product_type_id: pt.id )

    expect(pt.products.include?(prod)).to eq(true)
    expect(prod.product_type).to eq(pt)
  end

  it "can represent a well formed product within our catalog" do
    pt = create(:product_type)
    prod = create(:product_category, product_type_id: pt.id )
    costs = create_list(:costs, 4)
    costs[3].active = true
    prices = build_list(:price, 4)
    prices[3].active = true
    prod.cost_history = costs
    prod.price_history = prices

    expect(prod.cost_history.length).to be(4)
    expect(prod.price_history.length).to be(4)
    expect(prod.active_cost).to be > -1
    expect(prod.active_price).to be > -1
    expect(prod.margin).to be > 0
  end
end
