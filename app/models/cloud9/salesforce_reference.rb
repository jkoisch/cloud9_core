class Cloud9::SalesforceReference < ActiveRecord::Base

  belongs_to :referenceable, :polymorphic => true
end