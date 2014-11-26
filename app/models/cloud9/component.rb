# == Schema Information
#
# Table name: components
#
#  id         :integer          not null, primary key
#  product_id :integer
#  notes      :text
#  system_id  :integer
#  created_at :datetime
#  updated_at :datetime
#  active     :boolean
#  quantity   :integer
#

class Cloud9::Component < ActiveRecord::Base

  belongs_to :product, :class_name => 'Cloud9::Product'
  has_many :requirements, as: :requireable
  belongs_to :system, :class_name => 'Cloud9::System'
  has_and_belongs_to_many :cloud9_orders, :class_name => 'Cloud9::Order'

  after_save :validate_product_quantity

  def validate_product_quantity
    self.quantity = self.product.required_quantity if self.product.present?
  end

end
