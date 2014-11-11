module Salesforce

  class Account < Salesforce::Base

    include ActiveModel::Model

    attr_accessor :id

    define_model_callbacks :initialize, only: [:after]

    def salesforce_data
      @data ||= @client.account(self.id.to_s)
      @data
    end

  end

end