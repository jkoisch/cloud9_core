# == Schema Information
#
# Table name: measurements
#
#  id                      :integer          not null, primary key
#  system_id               :integer
#  raw_metric_data         :text
#  ram                     :integer
#  cpu                     :integer
#  created_at              :datetime
#  updated_at              :datetime
#  average_ram_utilization :decimal(5, 2)
#  total_hd_space          :integer
#  free_hd_space           :integer
#  total_users             :integer
#  pagefile_size           :integer
#  dataserver              :boolean
#  datastore_location      :string(255)
#  pagefile_location       :string(255)
#

# Systems get measured periodically to check usage, capacity, etc. This simply holds the values
class Cloud9::Measurement < ActiveRecord::Base

  belongs_to :cloud9_system, :class_name => 'Cloud9::System'

  def creation_date_fmt
    self.created_at.strftime '%m-%d-%C-%HH'
  end

end
