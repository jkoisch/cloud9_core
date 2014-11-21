class ProductSerializer < ActiveModel::Serializer

  attributes :id, :name, :description, :active_cost
  has_many :costs

end