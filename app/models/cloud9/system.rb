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

  def vm
    self.virtual_machine_identifier
  end

  def defaults

    if self.customer_id.blank?
      cloud9CustomerProfile = Cloud9::Customer.find_by(organization_name: "Cloud9RealTime")
      self.customer_id = cloud9CustomerProfile.id
      self.save
    end

    if self.components.blank?
      ['ram', 'cpu', 'hd_boot'].each do |k|
        id = eval("Cloud9::Product.#{k}_id")
        self.components << Cloud9::Component.new(system_id: self.id, product_id: id, customer_id: self.customer_id)
      end
      self.save
    end

  end

  def self.retrieve_by_vm_id(virtual_machine_id, cust_id)
    Cloud9::System.find_or_create_by(virtual_machine_identifier: virtual_machine_id, customer_id: cust_id)
  end

  def active_components
    self.components.where(:active => true)
  end

  def recent_update
    self.measurements.last.created_at.strftime '%c'
  end


end
