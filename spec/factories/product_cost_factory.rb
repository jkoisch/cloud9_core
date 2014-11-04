# == Schema Information
#
# Table name: product_costs
#
#  id         :integer          not null, primary key
#  product_id :integer
#  cost       :integer
#  active     :boolean
#  created_at :datetime
#  updated_at :datetime
#

FactoryGirl.define do
  factory :product_cost do
    cost { generate(:val) }
    active false
  end

  sequence :val do |v|
    v.to_i + rand(300).to_i
  end
end
