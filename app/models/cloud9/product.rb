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

class  Cloud9::Product < ActiveRecord::Base
  include Concerns::Invoiceable

  has_many :requirements, as: :requireable
  has_many :product_licenses
  has_many :costs, :dependent => :destroy
  has_many :product_prices, :dependent => :destroy
  belongs_to :product_type
  has_and_belongs_to_many :product_groups
  has_and_belongs_to_many :orders

  accepts_nested_attributes_for :costs
  accepts_nested_attributes_for :product_prices

  validates_presence_of :name, :description

  after_create :defaults

  def defaults
    default_invoice_names
  end

  # Determines the active cost for this product
  def active_cost
    if self.costs.length > 0
      i = self.costs.find_index { |f| (f.active == true)}
      self.costs[i].amount
    else
      0
    end
  end

  # Determines the active price for this product
  def active_price
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
