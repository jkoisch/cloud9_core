# == Schema Information
#
# Table name: contacts
#
#  id                 :integer          not null, primary key
#  cloud9_customer_id :integer
#  email              :string(255)
#  authorized         :boolean
#  primary            :boolean
#

class Cloud9::Contact < ActiveRecord::Base

  belongs_to :cloud9_customer, :foreign_key => :cloud9_customer_id
  has_one :salesforce_reference, as: :referenceable

end
