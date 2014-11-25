class PriceSerializer < ActiveModel::Serializer
  attributes :amount, :active, :product_id, :active_date, :id
end