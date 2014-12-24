class ComponentSerializer < ActiveModel::Serializer
  attributes :id, :product_id, :system_id, :active, :quantity, :customer_id, :created_at
  has_one :product
end
