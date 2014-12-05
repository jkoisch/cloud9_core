class ComponentSerializer < ActiveModel::Serializer
  attributes :id, :product_id, :system_id, :active, :quantity, :created_at
  has_one :product
end
