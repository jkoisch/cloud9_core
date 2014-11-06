Restforce.configure do |config|

  config.client_id           = Figaro.env.salesforce_key
  config.client_secret       = Figaro.env.salesforce_secret

end