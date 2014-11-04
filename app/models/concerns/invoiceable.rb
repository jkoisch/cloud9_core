module Concerns
  module Invoiceable
    def default_invoice_names
      self.invoice_name = self.name if self.invoice_name.blank?
      self.invoice_description = self.description if self.invoice_description.blank?
      self.save!
    end
  end
end