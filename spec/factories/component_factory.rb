ns = Cloud9::Component

FactoryGirl.define do
  factory :non_system_component, :class => ns do
    customer
    product

    factory :component, :class => ns do
      system
    end
  end
end