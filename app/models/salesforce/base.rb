module Salesforce

  class Base

    @data
    @client

    def initialize(attributes = {})
      attributes.each do |name, value|
        send("#{name}=", value)
      end

      run_callbacks :initialize do
        set_client
      end
    end
    #
    # def method_missing(m, *args)
    #   begin
    #     salesforce_data.send(m)
    #   rescue
    #     super
    #   end
    # end

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