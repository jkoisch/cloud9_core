# == Schema Information
#
# Table name: salesforce_references
#
#  id                 :integer          not null, primary key
#  salesforce_id      :string(255)
#  salesforce_url     :string(255)
#  referenceable_id   :integer
#  referenceable_type :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#

class Cloud9::SalesforceReference < ActiveRecord::Base

  belongs_to :referenceable, :polymorphic => true
end
