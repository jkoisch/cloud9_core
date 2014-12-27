
# Table name: contacts
#
#  id                 :integer          not null, primary key
#  cloud9_customer_id :integer
#  email              :string(255)
#  authorized         :boolean
#  primary            :boolean
#  name               :string(255)
#  role               :string(255)

ns = Cloud9::Contact

FactoryGirl.define do
  factory :contact, :class => ns do
    name "John Doe"
    role "admin"
    primary true
    email "john.doe@johndoes.com"
  end
end