module Salesforce
  module ForceClient

    class << self

      def new
        Salesforce::ForceClient::Base.new
      end

    end


    class Base
      attr_accessor :username, :password, :security_token, :salesforce_response, :client

      def initialize
        self.username = ENV['salesforce_user']
        self.password = ENV['salesforce_pw']
        self.security_token = ENV['salesforce_token']

        if self.client.blank?
          @client = Restforce.new :username => self.username,
                                      :password => self.password,
                                      :security_token => self.security_token
        end
      end

      def method_missing(m, *args)

        @client.find(m.to_s,args[0])

      end

    end

  end
end