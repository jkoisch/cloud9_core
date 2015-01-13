module Authorizenet
  class Transaction

    def self.build
      new
    end

    def initialize()
    end

    def call(cc_number, cc_expiration, total)
      transaction = AuthorizeNet::AIM::Transaction.new(Figaro.env.authorize_net_login, Figaro.env.authorize_net_transaction_key, :gateway => :sandbox)
      #credit_card = AuthorizeNet::CreditCard.new('4111111111111111', '1120')
      credit_card = AuthorizeNet::CreditCard.new(cc_number, cc_expiration)
      response = transaction.purchase(total, credit_card)
    end

  end
end
