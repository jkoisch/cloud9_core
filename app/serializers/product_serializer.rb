class ProductSerializer < ActiveModel::Serializer

  attributes :id, :name, :description, :active_cost, :status, :notes
  has_many :costs

end