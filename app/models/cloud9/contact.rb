# == Schema Information
#
# Table name: contacts
#
#  id                 :integer          not null, primary key
#  cloud9_customer_id :integer
#  email              :string(255)
#  authorized         :boolean
#  primary            :boolean
#  name               :string(255)
#  role               :string(255)
#

class Cloud9::Contact < ActiveRecord::Base

  belongs_to :customer, :foreign_key => :cloud9_customer_id
  has_one :salesforce_reference, as: :referenceable

  def display_name
    "#{name} (#{email})"
  end

end
