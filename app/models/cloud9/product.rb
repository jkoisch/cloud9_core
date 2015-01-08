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
#  unit_price          :boolean
#  percentage_price    :boolean
#  contract_percentage :integer
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
      if i.nil?
        activate_cost(self.cost_history.last)
        i = self.cost_history.find_index { |f| (f.active == true)}
      end
      self.cost_history[i].amount
    else
      0
    end
  end

  # Determines the active price for this product
  def active_price
    if self.price_history.length > 0
      i = self.price_history.find_index { |f| f.active }
      if i.nil?
        activate_price(self.price_history.last)
        i = self.price_history.find_index { |f| f.active }
      end
      self.price_history[i].amount
    else
      0
    end
  end

  def active_price=(val)
    price = Cloud9::Price.create(
        product_id: self.id,
        amount: val
    )
    self.activate_price(price)
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
    unit_pricing("ram", "ram").id
  end

  def self.cpu_id
    unit_pricing("cpu", "cpu").id
  end

  def self.hd_boot_id
    unit_pricing("hard drive","hard drive boot").id
  end

  def self.hd_data_id
    unit_pricing("hard drive","hard drive data").id
  end

  def self.match_component(key)
    map = map_to_component(key)
    map.nil? ? nil : Cloud9::Product.find_by(name: map).id
  end

  private
  def self.unit_pricing(type, unit)
    type = Cloud9::ProductType.select(:id).find_by(name: "#{type.downcase}")
    prod = Cloud9::Product.find_or_create_by(:product_type_id => type.id, :active => true, :name => "#{unit.downcase} unit", :unit_price => true, :status => "production")
  end

  def self.map_to_component(key)
    matching_hash = {"virtual_machine_identifier" => "ignore","notes" => "ignore","ram"  => "ram unit", "cpu"  => "cpu unit","total_hd_space" => "hard drive boot unit","free_hd_space" => "ignore","average_ram_utilization"  => "ignore","pagefile_size" => "ignore", "dataserver" => "ignore","datastore_location"  => "ignore","pagefile_location" => "ignore","total_users" => "vm user"}
    p "MATCH!!!!!!     " +  matching_hash[key]
    matching_hash[key].downcase.eql?("ignore") ? nil : matching_hash[key]
  end

end
