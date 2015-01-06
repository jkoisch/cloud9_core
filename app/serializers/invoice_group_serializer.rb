class InvoiceGroupSerializer < ActiveModel::Serializer
  attributes :total, :name, :description
end