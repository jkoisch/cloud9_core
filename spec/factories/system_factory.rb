#  virtual_machine_identifier :string(255)
#  raw_data                   :text
#  customer_id                :integer

ns = Cloud9::System
FactoryGirl.define do
  factory :system, :class => ns do
    virtual_machine_identifier "system_1"
    customer
  end
end