# == Schema Information
#
# Table name: opportunities
#
#  id         :integer          not null, primary key
#  created_at :datetime
#  updated_at :datetime
#

# The Cloud9::Opportunity is just a mapping class from the hash provided by Salesforce. We get most of that for free
# by using Hashie.
class Cloud9::Opportunity < ActiveRecord::Base

  has_one :salesforce_reference, as: :referenceable

  def new()
    @id = Cloud9::Opportunity.create
  end

  def update

  end

  def information

    sf_map = SalesForceMap.new

  end

end
