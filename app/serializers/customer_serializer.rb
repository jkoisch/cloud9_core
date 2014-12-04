class CustomerSerializer < ActiveModel::Serializer
  attributes :first_name, :last_name, :organization_name, :role, :email, :id
end