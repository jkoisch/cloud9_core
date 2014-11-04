# == Schema Information
#
# Table name: product_groups
#
#  id                  :integer          not null, primary key
#  name                :string(255)
#  description         :text
#  invoice_name        :string(255)
#  invoice_description :text
#  active              :boolean
#  created_at          :datetime
#  updated_at          :datetime
#

require 'rails_helper'

RSpec.describe ProductGroup, :type => :model do
  it "has a name and description" do
    prod = build(:product_group)

    expect(prod.valid?).to eq(true)
    expect(prod.name.is_a?(String)).to eq(true)
    expect(prod.description.is_a?(String)).to eq(true)
    expect(prod.name).to eq('product_group_1')
    expect(prod.description).to eq('product_group_1 description')
  end

  it "gets the defaults set for invoice items" do
    prod = create(:product_group)

    expect(prod.invoice_name.blank?).to eq(false)
    expect(prod.invoice_description.blank?).to eq(false)
  end

  it "can include products that represent several instances of a product type" do
    pt = create(:product_type)
    prod1 = create(:product, product_type_id: pt.id )
    prod2 = create(:product, product_type_id: pt.id )
    pt1 = create(:product_type)
    prod3 = create(:product, product_type_id: pt1.id )
    prod4 = create(:product, product_type_id: pt1.id )

    expect(pt.products.include?(prod1)).to eq(true)
    expect(pt.products.include?(prod2)).to eq(true)
    expect(pt1.products.include?(prod3)).to eq(true)
    expect(pt1.products.include?(prod4)).to eq(true)

    pg = create(:product_group)
    pg.products = [prod1,prod2,prod3,prod4]
    expect(pg.products.length).to eq(4)
    expect(pg.products.include?(prod2)).to eq(true)
  end
end
