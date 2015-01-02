#  first_name        :string(255)
#  last_name         :string(255)
#  organization_name :string(255)
#  role              :string(255)
#  email             :string(255)
ns = Cloud9::Customer

FactoryGirl.define do
  factory :customer, :class => ns do
    organization_name 'Organization'

    factory :customer_with_contacts do
      transient do
        contact_count 5
      end

      after(:create) do |customer, evaluator|
        create_list(:contact, evaluator.contact_count, customer: customer)
      end

      factory :customer_with_systems do

        transient do
          system_count 5
        end

        after(:create) do |customer, evaluator|
          create_list(:system, evaluator.system_count, customer: customer)
        end

        factory :customer_with_spare_components do
          transient do
            component_count 5
          end

          after(:create) do |customer, evaluator|
            create_list(:component, evaluator.component_count, customer: customer)
          end
        end

      end
    end


  end
end