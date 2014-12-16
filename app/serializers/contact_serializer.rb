class ContactSerializer < ActiveModel::Serializer
  attributes :name, :email, :role, :id, :cloud9_customer_id
end