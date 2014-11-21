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

ns = Cloud9::ProductGroup

FactoryGirl.define do
  factory :product_group, :class => ns do
    name "product_group_1"
    description "product_group_1 description"
  end
end
