module Concerns
  module Invoiceable

    #On the invoice, some items have user_friendly names or descriptions.
    def default_invoice_names
      self.invoice_name = self.name if self.invoice_name.blank?
      self.invoice_description = self.description if self.invoice_description.blank?
      self.save
    end
  end
end