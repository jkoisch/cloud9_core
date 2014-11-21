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

ns = Cloud9::Cost

FactoryGirl.define do
  factory :cost, :class => ns do
    amount { generate(:val) }
    active false
  end

  sequence :val do |v|
    v.to_i + rand(300).to_i
  end
end
