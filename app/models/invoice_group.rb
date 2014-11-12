class InvoiceGroup

  belongs_to :invoice
  has_many :invoice_groups

end