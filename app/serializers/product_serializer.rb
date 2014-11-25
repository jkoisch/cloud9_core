class ProductSerializer < ActiveModel::Serializer

  attributes :id, :name, :description, :active_cost, :status, :notes, :active_price, :invoice_name, :invoice_description
  has_many :costs
  has_many :prices

end