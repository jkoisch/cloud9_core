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

class ProductCost < ActiveRecord::Base
  belongs_to :product
end
