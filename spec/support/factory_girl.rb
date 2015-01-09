RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods

  config.before(:suite) do
    DatabaseCleaner.strategy = :deletion

    #I HATE this. But I think this is necessary for now
    #todo .... get rid of this
    load "#{Rails.root}/db/seeds.rb"
    begin
      DatabaseCleaner.start
      FactoryGirl.lint
    ensure
      DatabaseCleaner.clean
    end
  end
end