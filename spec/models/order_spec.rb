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

RSpec.describe Order, :type => :model do

  it "has notes attached to it" do
    ord = build(:order)

    expect(ord.notes.blank?).to eq(false)
  end

  it "has a set of products associated with it" do
    pt = create(:product_type)
    prod1 = create(:product, product_type_id: pt.id )
    prod2 = create(:product, product_type_id: pt.id )
    pt1 = create(:product_type)
    prod3 = create(:product, product_type_id: pt1.id )
    prod4 = create(:product, product_type_id: pt1.id )

    pg = create(:product_group)
    pg.products = [prod1,prod2,prod3,prod4]
    expect(pg.products.length).to eq(4)
    expect(pg.products.include?(prod2)).to eq(true)

    ord = create(:order)
    ord.products = pg.products
    expect(ord.products.length).to eq(4)
    expect(ord.products.include?(prod2)).to eq(true)
  end
end
