class CustomerSerializer < ActiveModel::Serializer
  attributes :organization_name, :id
  has_many :contacts
end