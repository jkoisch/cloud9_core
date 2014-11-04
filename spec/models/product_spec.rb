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

RSpec.describe Product, :type => :model do
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
    costs = create_list(:product_cost, 4)
    costs[3].active = true
    prices = build_list(:product_price, 4)
    prices[3].active = true
    prod.product_costs = costs
    prod.product_prices = prices

    expect(prod.product_costs.length).to be(4)
    expect(prod.product_prices.length).to be(4)
    expect(prod.cost).to be > -1
    expect(prod.price).to be > -1
    expect(prod.margin).to be > 0
  end
end
