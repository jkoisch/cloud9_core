class ProductSerializer < ActiveModel::Serializer

  attributes :id, :name, :active, :description, :active_cost, :status, :notes, :active_price, :invoice_name, :invoice_description, :product_type_id, :unit_price, :required_quantity
  has_many :costs
  has_many :prices
  has_one :product_type

end