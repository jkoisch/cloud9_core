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

#A CLoud9::Customer is a first class object that has many systems, will manage contact and payment information, will
# be assigned roles to manage some things in the Cloud9 Universe (add a user, for example)
class Cloud9::Customer < ActiveRecord::Base

  has_many :cloud9_systems, :class_name => 'Cloud9::System'
  has_many :cloud9_invoices, :class_name => 'Cloud9::Invoice'

  def self.cloud9_default
    Cloud9::Customer.find_by(
        first_name: Settings.cloud9_customer_first_name,
        last_name: Settings.cloud9_customer_last_name,
        organization_name: Settings.cloud9_customer_organization_name,
        email: Settings.cloud9_customer_email
    )
  end

end
