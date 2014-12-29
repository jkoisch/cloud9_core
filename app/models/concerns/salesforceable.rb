module Concerns
  module Salesforceable

    #Data resides in Salesforce. This object's reference to the salesforce object base.
    def needs_hug_from_sf
      self.salesforce_reference.blank?
    end

    def initialize_from_salesforce
      if self.needs_hug_from_sf
        update_from_salesforce
      end
    end
  end
end