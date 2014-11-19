class ProductCostSerializer < ActiveModel::Serializer
  attributes :cost, :product_id, :id
end