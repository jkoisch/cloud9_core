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

#Cloud9 systems map in any number of ways to Salesforce. This polymorphic record holds that salesforce reference, and a little bit of information about that record on salesforce (the ID and the URL for the RESTful resource)
class Cloud9::SalesforceReference < ActiveRecord::Base

  belongs_to :referenceable, :polymorphic => true
end
