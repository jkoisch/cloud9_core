# == Schema Information
#
# Table name: orders
#
#  id         :integer          not null, primary key
#  notes      :text
#  created_at :datetime
#  updated_at :datetime
#  invoice_id :integer
#

ns = Cloud9::Order

FactoryGirl.define do
  factory :order, :class => ns do
    notes "Simple notes on this order"
  end
end
