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

    def find_contacts
      if self.id.nil?
        self.find
      end
      @client.query("select Id, Email, Name, Status__c, IsDeleted, Primary_Contact__c, Authorized_Contact__c from Contact where AccountId = '#{self.id}'")
    end

    def salesforce_data
      if self.id.nil?
        self.find
      end
      @data ||= @client.account(self.id.to_s)
      @data
    end

  end

end