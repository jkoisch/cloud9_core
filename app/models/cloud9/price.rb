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

class Cloud9::Price < ActiveRecord::Base
  belongs_to :product

  def active_date
    self.updated_at
  end
end
