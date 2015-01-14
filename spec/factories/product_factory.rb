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
      product_type
      name "product_1"
      description "product_1 description"

      transient do
        count 2
      end

      after(:create) do |product, evaluator|
        create_list(:price, evaluator.count, product: product)
        create_list(:costs, evaluator.count, product: product)
      end

    end

    factory :product_category, :class => ns do
      product_type
      name "product with category"
      description "product with category (type)"
    end

    factory :product_with_required_quantity, :class => ns do
      product_type
      name "product_1"
      description "product_1 description"
      required_quantity 500
    end

    factory :product_for_licensure, :class => ns do
      product_type
      name "software license"
      description "licensure description"
      invoice_name "invoice software license"
      invoice_description "invoice licensure description"
    end
  end
