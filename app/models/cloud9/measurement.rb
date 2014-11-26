# == Schema Information
#
# Table name: measurements
#
#  id                       :integer          not null, primary key
#  system_id                :integer
#  raw_metric_data          :text
#  ram                      :integer
#  cpu                      :integer
#  hard_drive_space         :integer
#  per_user_ram_utilization :integer
#  created_at               :datetime
#  updated_at               :datetime
#

class Cloud9::Measurement < ActiveRecord::Base

  belongs_to :cloud9_system, :class_name => 'Cloud9::System'

end
