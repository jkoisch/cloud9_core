# == Schema Information
#
# Table name: orders
#
#  id         :integer          not null, primary key
#  notes      :text
#  created_at :datetime
#  updated_at :datetime
#

FactoryGirl.define do
  factory :order do
    notes "Simple notes on this order"
  end
end
