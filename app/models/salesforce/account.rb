module Salesforce

  class Account < Salesforce::Base

    include ActiveModel::Model

    attr_accessor :id, :account_number

    define_model_callbacks :initialize, only: [:after]

    def find
      unless self.account_number.blank?
        accounts = @client.query("select Id from Account where AccountNumber = '#{self.account_number}'")
        self.id = accounts.first.Id
        salesforce_data
      end
    end

    def salesforce_data
      @data ||= @client.account(self.id.to_s)
      @data
    end

  end

end