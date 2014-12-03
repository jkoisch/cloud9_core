# == Schema Information
#
# Table name: costs
#
#  id         :integer          not null, primary key
#  product_id :integer
#  active     :boolean
#  created_at :datetime
#  updated_at :datetime
#  amount     :integer
#

#The cost of a Product that will be recorded against so that we can figure out margins. May be active or inactive,
# and keeps the creation date so that metrics may be tied to cost-at-time-of-contract
class Cloud9::Cost < ActiveRecord::Base
  belongs_to :product

  def active_date
    self.updated_at
  end
end
