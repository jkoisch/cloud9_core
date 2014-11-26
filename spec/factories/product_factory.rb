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

ns = Cloud9::Product

  FactoryGirl.define do
    factory :product, :class => ns do
      name "product_1"
      description "product_1 description"
    end

    factory :product_category, :class => ns do
      product_type
      name "product with category"
      description "product with category (type)"
    end

    factory :product_with_required_quantity, :class => ns do
      name "product_1"
      description "product_1 description"
      required_quantity 500000000
    end
  end
