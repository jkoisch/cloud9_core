#  first_name        :string(255)
#  last_name         :string(255)
#  organization_name :string(255)
#  role              :string(255)
#  email             :string(255)
ns = Cloud9::Customer

FactoryGirl.define do
  factory :customer, :class => ns do
    first_name 'First'
    last_name 'Last'
    organization_name 'Organization'
    email 'me@example.com'
  end
end