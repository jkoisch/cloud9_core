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
#  status              :string(255)
#  notes               :text
#  required_quantity   :integer
#

#Cloud9::Products can be invoiced against because they have a cost and a price, can be grouped into convenient sets
# (sell a Basic System, not 12 products), and can be associated with a license.
class  Cloud9::Product < ActiveRecord::Base
  include Concerns::Invoiceable

  has_many :product_licenses
  has_many :cost_history, :class => Cloud9::Cost, :dependent => :destroy
  has_many :price_history, :class => Cloud9::Price, :dependent => :destroy
  has_many :costs, :class => Cloud9::Cost, :dependent => :destroy
  has_many :prices, :class => Cloud9::Price, :dependent => :destroy
  belongs_to :product_type
  has_one :cloud9_component, :class_name => 'Cloud9::Component'
  has_and_belongs_to_many :product_groups

  accepts_nested_attributes_for :cost_history
  accepts_nested_attributes_for :price_history

  validates_presence_of :name, :description, :product_type_id

  after_create :defaults

  def defaults
    default_invoice_names
  end

  # Determines the active cost for this product
  def active_cost
    if self.cost_history.length > 0
      i = self.cost_history.find_index { |f| (f.active == true)}
      self.cost_history[i].amount
    else
      0
    end
  end

  # Determines the active price for this product
  def active_price
    if self.price_history.length > 0
      i = self.price_history.find_index { |f| (f.active == true)}
      self.price_history[i].amount
    else
      0
    end
  end

  # A simple view of the margin provided by this product
  def margin
    active_price - active_cost
  end

  def activate_cost(cost)
    #set each of the costs
    self.costs.each do |c|
      c.active = false
      c.save
    end

    cost.active = true
    cost.save
    cost
  end

  def activate_price(price)
    #set each of the prices
    self.prices.each do |p|
      p.active = false
      p.save
    end

    price.active = true
    price.save
    price
  end

  def self.active_product_list
    Cloud9::Product.where(active: true)
  end

  def self.ram_id
    type = Cloud9::ProductType.select(:id).find_by(name: "RAM")
    Cloud9::Product.find_by(:product_type_id => type.id, :active => true, :name.downcase => 'ram')
  end

  def self.cpu_id
    98498
  end

  def self.hd_id
    98497
  end

end
