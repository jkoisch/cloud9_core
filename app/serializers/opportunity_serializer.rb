#This class maps from the salesforce data, mapped to the object via Hashie, into the serialization that we want. For
# some reason, we have to define the mappings here on the serializer instead of on the object or in a more generic
# way. TODO we should revisit this because it may be a part of AMS's immaturity
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