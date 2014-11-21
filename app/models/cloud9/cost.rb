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

class Cloud9::Cost < ActiveRecord::Base
  belongs_to :product

  def active_date
    self.updated_at
  end
end