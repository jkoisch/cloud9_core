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

  has_many :cloud9_components, :class_name => 'Cloud9::Component'
  belongs_to :cloud9_customer, :class_name => 'Cloud9::Customer'
  has_and_belongs_to_many :cloud9_users, :class_name => 'Cloud9::User'

end
