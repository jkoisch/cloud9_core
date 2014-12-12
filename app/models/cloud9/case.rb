class Cloud9::Case < ActiveRecord::Base
  has_one :salesforce_reference, as: :referenceable

end