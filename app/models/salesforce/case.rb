module Salesforce
  class Case < Salesforce::Base

    include ActiveModel::Model

    attr_accessor :id

    define_model_callbacks :initialize, only: [:after]

    def salesforce_data
      @data ||= @client.case(self.id.to_s)
    end

  end
end