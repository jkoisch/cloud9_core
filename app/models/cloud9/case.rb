# == Schema Information
#
# Table name: cases
#
#  id         :integer          not null, primary key
#  created_at :datetime
#  updated_at :datetime
#

class Cloud9::Case < ActiveRecord::Base
  has_one :salesforce_reference, as: :referenceable

end
