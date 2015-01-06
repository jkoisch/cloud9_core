class InvoiceSerializer < ActiveModel::Serializer

  attributes :id, :customer_id, :total, :workflow_state, :notes, :bill_date, :pay_date
  has_many :invoice_groups

end