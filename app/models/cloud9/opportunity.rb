# The Cloud9::Opportunity is just a mapping class from the hash provided by Salesforce. We get most of that for free
# by using Hashie.
class Cloud9::Opportunity < Hashie::Mash

  def new()
    @id = Cloud9::Opportunity.create
  end

  def update

  end
end