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

class Cloud9::System < ActiveRecord::Base

  has_many :components, :class_name => 'Cloud9::Component'
  has_many :measurements, :class_name => 'Cloud9::Measurement'
  belongs_to :customer, :class_name => 'Cloud9::Customer'
  has_and_belongs_to_many :users, :class_name => 'Cloud9::User'

  after_create :defaults

  def defaults
    if self.components.blank?
      c_ram = Cloud9::Component.create(
          system_id: self.id,
          product_id: Cloud9::Product.ram_id
      )

      c_cpu = Cloud9::Component.create(
          system_id: self.id,
          product_id: Cloud9::Product.cpu_id
      )

      c_hd = Cloud9::Component.create(
          system_id: self.id,
          product_id: Cloud9::Product.hd_id
      )
    end
  end

  #TODO encapsulated logic to deal with updating metrics. This should eventually kick off alerts, etc.
  def update_measurement(sys)
    self.measurements << Cloud9::Measurement.new(
      system_id: sys[:system_id],
      raw_metric_data: sys.to_s,
      ram: sys[:ram],
      cpu: sys[:cpu],
      hard_drive_space: sys[:hd_space]
    )

    self.save
  end

end
