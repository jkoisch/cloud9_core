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
#  cloud9_identifier :string(255)
#

#A CLoud9::Customer is a first class object that has many systems, will manage contact and payment information, will
# be assigned roles to manage some things in the Cloud9 Universe (add a user, for example)
class Cloud9::Customer < ActiveRecord::Base

  has_many :cloud9_systems, :class_name => 'Cloud9::System'
  has_many :cloud9_invoices, :class_name => 'Cloud9::Invoice'
  has_one :salesforce_reference, as: :referenceable

  def self.cloud9_default
    Cloud9::Customer.find_by(
        first_name: Settings.cloud9_customer_first_name,
        last_name: Settings.cloud9_customer_last_name,
        organization_name: Settings.cloud9_customer_organization_name,
        email: Settings.cloud9_customer_email
    )
  end

  def self.retrieve_by_cloud9_id(identifier)
    cust = Cloud9::Customer.find_or_initialize_by(cloud9_identifier: identifier)
    if cust.new_record?
      #todo ... put off on delyed job
      cust.attach_to_salesforce
    end
    cust.save!
    cust
  end

  def attach_to_salesforce
    acct = Salesforce::Account.new(account_number: self.cloud9_identifier)
    acct.find

    ref = Cloud9::SalesforceReference.new(
      referenceable_id: self.id,
      referenceable_type: self.class.name,
      salesforce_id: acct.salesforce_data.Id,
      salesforce_url: acct.salesforce_data.attributes.url
    )
    self.salesforce_reference = ref
    self.organization_name = acct.salesforce_data.Name
    self
  end

end
