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

FactoryGirl.define do
  factory :product_type do
    name "product_type_1"
    description "product_type_1 description"
  end
end
