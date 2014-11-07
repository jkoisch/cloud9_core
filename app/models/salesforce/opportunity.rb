module Salesforce
  class Opportunity
    include ActiveModel::Model

    attr_accessor :id

    define_model_callbacks :initialize, only: [:after]

    def initialize(attributes = {})
      attributes.each do |name, value|
        send("#{name}=", value)
      end

      run_callbacks :initialize do
        set_client
      end
    end

    def salesforce_data
      @data ||= @client.opportunity(self.id.to_s)
      @data
    end

    private
      @data
      @client
      def data
        @data
      end

      def data=(val)
        @data = val
      end

      def set_client
        @client ||= Salesforce::ForceClient.new
      end

  end
end