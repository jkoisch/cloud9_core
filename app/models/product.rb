# == Schema Information
#
# Table name: products
#
#  id                  :integer          not null, primary key
#  name                :string(255)
#  description         :text
#  invoice_name        :string(255)
#  invoice_description :text
#  product_type_id     :integer
#  active              :boolean
#  created_at          :datetime
#  updated_at          :datetime
#

class  Product < ActiveRecord::Base
  include Concerns::Invoiceable

  has_many :requirements, as: :requireable
  has_many :product_licenses
  has_many :product_costs
  has_many :product_prices
  belongs_to :product_type
  has_and_belongs_to_many :product_groups
  has_and_belongs_to_many :orders

  validates_presence_of :name, :description

  after_create :defaults

  def defaults
    default_invoice_names
  end

  # Determines the active cost for this product
  def cost
    if self.product_costs.length > 0
      i = self.product_costs.find_index { |f| (f.active == true)}
      self.product_costs[i].cost
    else
      0
    end
  end

  # Determines the active price for this product
  def price
    if self.product_prices.length > 0
      i = self.product_prices.find_index { |f| (f.active == true)}
      self.product_prices[i].price
    else
      0
    end
  end

  # A simple view of the margin provided by this product
  def margin
    price - cost
  end

end
