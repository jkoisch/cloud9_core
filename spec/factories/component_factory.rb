ns = Cloud9::Component

FactoryGirl.define do
  factory :component, :class => ns do
    association :product, factory: :product_for_licensure
    customer
    active true
  end
end