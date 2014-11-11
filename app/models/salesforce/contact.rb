module Salesforce

  class Contact < Salesforce::Base

    include ActiveModel::Model

    attr_accessor :id

    define_model_callbacks :initialize, only: [:after]

    def salesforce_data
      @data ||= @client.contact(self.id.to_s)
      @data
    end

  end

end