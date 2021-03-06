# == Schema Information
#
# Table name: components
#
#  id          :integer          not null, primary key
#  product_id  :integer
#  notes       :text
#  system_id   :integer
#  created_at  :datetime
#  updated_at  :datetime
#  quantity    :integer
#  customer_id :integer
#

#Cloud9::Components have a one to one relationship with a product, can be grouped into orders to be built into
# systems, and may have a number of requirements that provide for business checks (can't add a user if there isn't
# enough RAM, for example)
class Cloud9::Component < ActiveRecord::Base

  belongs_to :product, :class_name => 'Cloud9::Product'
  has_many :requirements, as: :requireable
  belongs_to :system, :class_name => 'Cloud9::System'
  belongs_to :customer, :class_name => 'Cloud9::Customer'
  has_and_belongs_to_many :cloud9_orders, :class_name => 'Cloud9::Order'

  before_save :check_product_quantity

  # Products may impose a required quantity on a component; For example, you may have to buy RAM in 4 Gb blocks. This
  # is really just for internal consistency.
  def check_product_quantity
    if self.product.present?
      if self.quantity.present? && self.product.required_quantity.present?
        if self.quantity < self.product.required_quantity || self.quantity.nil?
          self.quantity = self.product.required_quantity unless self.product.required_quantity.nil?
        end
      else
        self.quantity = self.product.required_quantity unless self.product.required_quantity.nil?
      end
    end
  end

  def initialize(options = {})
    super
    self.system_id = options[:system_id]
    self.product_id = options[:product_id]
    self.customer_id = options[:customer_id]
    self.quantity = options[:quantity]
  end

  def self.billable(customer)
    Cloud9::Component.where("customer_id =? AND active = true",customer)
  end

  def self.billable_by_system(customer,system)
    billable(customer).where("system_id = ?", system)
  end

  def invoice_price
    if self.system_id.present?
      if self.quantity.present? && self.product.active_price.present?
        self.unit_quantity * self.product.active_price
      else
        0
      end
    else
      self.product.active_price
    end
  end

  def unit_quantity
    gig = 1000000000
    if self.product.name.include?("hard drive")
      self.quantity / gig
    else
      self.quantity
    end
  end

end
