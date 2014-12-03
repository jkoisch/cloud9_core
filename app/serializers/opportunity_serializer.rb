class OpportunitySerializer < ActiveModel::Serializer
  attributes :id, :description, :account_id

  def id
    object.Id
  end

  def account_id
    object.AccountId
  end

  def description
    object.Description
  end
end