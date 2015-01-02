class PriceSerializer < ActiveModel::Serializer
  attributes :amount, :active, :product_id, :active_date, :id

  def active_date
    object.updated_at
  end
end