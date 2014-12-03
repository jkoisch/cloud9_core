# == Schema Information
#
# Table name: prices
#
#  id         :integer          not null, primary key
#  product_id :integer
#  active     :boolean
#  created_at :datetime
#  updated_at :datetime
#  amount     :integer
#

#The price of a Product that will be invoiced against. May be active or inactive, and keeps the creation date so that
# contracts may be tied to price-at-time-of-contract
class Cloud9::Price < ActiveRecord::Base
  belongs_to :product

  def active_date
    self.updated_at
  end
end
