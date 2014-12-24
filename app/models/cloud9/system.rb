# == Schema Information
#
# Table name: systems
#
#  id                         :integer          not null, primary key
#  virtual_machine_identifier :string(255)
#  raw_data                   :text
#  customer_id                :integer
#  created_at                 :datetime
#  updated_at                 :datetime
#

#Cloud9::Systems are the key operational item for customers and admins to work with. Systems contain components, can
# be built using orders, can be measured, and have users
class Cloud9::System < ActiveRecord::Base

  has_many :components, :class_name => 'Cloud9::Component'
  has_many :measurements, :class_name => 'Cloud9::Measurement'
  belongs_to :customer, :class_name => 'Cloud9::Customer'
  has_and_belongs_to_many :users, :class_name => 'Cloud9::User'

  validates_presence_of :virtual_machine_identifier

  #TODO We need to make sure there are no systems without a customer
  #validates_associated :customer

  after_create :defaults

  def defaults
    if self.components.blank?
      ['ram', 'cpu', 'hd_boot'].each do |k|
        id = eval("Cloud9::Product.#{k}_id")
        self.components << Cloud9::Component.new(system_id: self.id, product_id: id)
      end
      self.save
    end

    if self.customer.blank?
      cloud9CustomerProfile = Cloud9::Customer.find_by(organization_name: "Cloud9RealTime")
      self.customer_id = cloud9CustomerProfile.id
      self.save
    end

  end

  #TODO encapsulated logic to deal with updating metrics. This should eventually kick off alerts, etc.
  def update_measurement(sys, system_id)
    self.measurements << Cloud9::Measurement.new(
      system_id: system_id,
      raw_metric_data: sys.to_s,
      ram: sys[:ram],
      cpu: sys[:cpu],
      total_hd_space: sys[:total_hd_space],
      free_hd_space: sys[:free_hd_space],
      average_ram_utilization: sys[:average_ram_utilization],
      total_users: sys[:total_users],
      pagefile_size: sys[:pagefile_size],
      dataserver: sys[:dataserver],
      datastore_location: sys[:datastore_location],
      pagefile_location: sys[:pagefile_location]
    )
    self.save
  end

  #needs to move this into a service
  def validate_components(sys, system_id, customer_id)
    sys.keys.each do |k|
      prod_id = Cloud9::Product.match_component(k)
      check_component(prod_id, sys[k], system_id, customer_id) unless prod_id.nil?
    end
  end

  def check_component(prod_id, qty, system_id, customer_id)
    comp = Cloud9::Component.find_or_initialize_by(:system_id => system_id, :product_id => prod_id, :active => true, :customer_id => customer_id)
    if comp.new_record?
      comp.quantity = qty
    else
      if comp.quantity != qty
        comp.active = false
        comp.save
        comp = Cloud9::Component.find_or_initialize_by(:system_id => system_id, :product_id => prod_id, :active => true, :quantity => qty, :customer_id => customer_id)
      end
    end
    comp.save!
  end

end
