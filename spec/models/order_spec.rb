# == Schema Information
#
# Table name: orders
#
#  id         :integer          not null, primary key
#  notes      :text
#  created_at :datetime
#  updated_at :datetime
#  invoice_id :integer
#

require 'rails_helper'

RSpec.describe Cloud9::Order, :type => :model do

  it "has notes attached to it" do
    ord = build(:order)

    expect(ord.notes.blank?).to eq(false)
  end

  it "has a set of products associated with it" do
    pt = create(:product_type)
    prod1 = create(:product, product_type_id: pt.id )
    comp1 = create(:component, product_id: prod1.id)
    prod2 = create(:product, product_type_id: pt.id )
    comp2 = create(:component, product_id: prod2.id)
    pt1 = create(:product_type)
    prod3 = create(:product, product_type_id: pt1.id )
    comp3 = create(:component, product_id: prod3.id)
    prod4 = create(:product, product_type_id: pt1.id )
    comp4 = create(:component, product_id: prod4.id)

    pg = create(:product_group)
    pg.products = [prod1,prod2,prod3,prod4]
    expect(pg.products.length).to eq(4)
    expect(pg.products.include?(prod2)).to eq(true)

    customer1 = create(:customer)

    ord = create(:order, customer_id: customer1.id)
    ord.components = [comp1,comp2,comp3,comp4]
    expect(ord.components.length).to eq(4)
    expect(ord.components[1].product_id).to eq(prod2.id)
  end
end
