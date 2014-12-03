module Salesforce
  module ForceClient

    class << self

      def new
        Salesforce::ForceClient::Base.new
      end

    end


    #initializes the client to get salesforce data
    class Base
      attr_accessor :username, :password, :security_token, :salesforce_response, :client

      def initialize
        self.username = ENV['salesforce_user']
        self.password = ENV['salesforce_pw']
        self.security_token = ENV['salesforce_token']

        if self.client.blank?
          self.client = Restforce.new :username => self.username,
                                      :password => self.password,
                                      :security_token => self.security_token
        end
      end

      #integrating with salesforce happens through configuration of the app
      def method_missing(m, *args)

        #todo We need to add a list of available 'methods' here to gut check
        begin
          self.client.find(m.to_s, args[0])
        rescue
          super
        end

      end

    end

  end
end