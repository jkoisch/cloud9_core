# == Schema Information
#
# Table name: product_types
#
#  id                     :integer          not null, primary key
#  name                   :string(255)
#  description            :text
#  parent_product_type_id :integer
#  invoice_name           :string(255)
#  invoice_description    :text
#  created_at             :datetime
#  updated_at             :datetime
#

require 'rails_helper'

RSpec.describe Cloud9::ProductType, :type => :model do
  it "has a name and description" do
    pt = build(:product_type)

    expect(pt.valid?).to eq(true)
    expect(pt.name.is_a?(String)).to eq(true)
    expect(pt.description.is_a?(String)).to eq(true)
    expect(pt.name).to eq('product_type_1')
    expect(pt.description).to eq('product_type_1 description')
  end

  it "gets the defaults set for invoice items" do
    pt = create(:product_type)

    expect(pt.invoice_name.blank?).to eq(false)
    expect(pt.invoice_description.blank?).to eq(false)
  end
end
