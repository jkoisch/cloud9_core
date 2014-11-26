# == Schema Information
#
# Table name: customers
#
#  id                :integer          not null, primary key
#  first_name        :string(255)
#  last_name         :string(255)
#  organization_name :string(255)
#  role              :string(255)
#  email             :string(255)
#  created_at        :datetime
#  updated_at        :datetime
#

class Cloud9::Customer < ActiveRecord::Base

  has_many :cloud9_users


end
