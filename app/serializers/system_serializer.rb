class SystemSerializer < ActiveModel::Serializer

  attributes :id, :virtual_machine_identifier, :customer_id, :updated_at
  has_many :components
  has_many :measurements

end