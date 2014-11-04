# == Schema Information
#
# Table name: product_prices
#
#  id         :integer          not null, primary key
#  product_id :integer
#  price      :integer
#  active     :boolean
#  created_at :datetime
#  updated_at :datetime
#

FactoryGirl.define do
  factory :product_price do
    price { generate(:p_val) }
    active false
  end

  sequence :p_val do |v|
    v.to_i + 300 + rand(300).to_i
  end
end
