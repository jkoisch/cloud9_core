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

#Cloud9::Components have a one to one relationship with a product, can be grouped into orders to be built into
# systems, and may have a number of requirements that provide for business checks (can't add a user if there isn't
# enough RAM, for example)
class Cloud9::Component < ActiveRecord::Base

  belongs_to :product, :class_name => 'Cloud9::Product'
  has_many :requirements, as: :requireable
  belongs_to :system, :class_name => 'Cloud9::System'
  has_and_belongs_to_many :cloud9_orders, :class_name => 'Cloud9::Order'

  after_save :validate_product_quantity

  # Products may impose a required quantity on a component; For example, you may have to buy RAM in 4 Gb blocks. This
  # is really just for internal consistency.
  def validate_product_quantity
    self.quantity = self.product.required_quantity if self.product.present?
  end

end
