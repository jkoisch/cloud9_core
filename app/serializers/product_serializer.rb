class ProductSerializer < ActiveModel::Serializer

  embed :ids, include: true

  attributes :id, :name, :description
  #, :cost, :active

  has_many :product_costs

end