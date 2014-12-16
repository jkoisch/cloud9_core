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
  has_many :contacts, :class_name => 'Cloud9::Contact', :foreign_key => :cloud9_customer_id
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
    cust = Cloud9::Customer.find_or_create_by(cloud9_identifier: identifier)
    if cust.needs_hug_from_sf
      cust.delay.initialize_from_salesforce
    end
    cust
  end

  def initialize_from_salesforce
    if self.needs_hug_from_sf
      update_from_salesforce
    end
  end

  def update_from_salesforce
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
    self.save!

    self.delay.find_contacts_in_salesforce
  end

  def find_contacts_in_salesforce
    acct = Salesforce::Account.new(account_number: self.cloud9_identifier)
    contacts = acct.find_contacts
    contacts.each do |contact|
      if contact.Status__c.eql? 'Active'
        c = Cloud9::Contact.create(
          email: contact.Email,
          cloud9_customer_id: self.id,
          name: contact.Name,
          primary: contact.Primary_Contact__c,
          authorized: contact.Authorized_Contact__c
        )

        ref = Cloud9::SalesforceReference.new(
            referenceable_id: c.id,
            referenceable_type: c.class.name,
            salesforce_id: contact.Id,
            salesforce_url: contact.attributes.url
        )
        c.salesforce_reference = ref
        c.save!
      end
    end
  end

  #Data resides in Salesforce. This object's reference to the salesforce object base.
  def needs_hug_from_sf
    self.salesforce_reference.blank?
  end

end
