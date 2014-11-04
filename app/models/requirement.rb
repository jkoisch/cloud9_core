# == Schema Information
#
# Table name: requirements
#
#  id               :integer          not null, primary key
#  requireable_id   :integer
#  requireable_type :string(255)
#  requirement_rule :text
#  active           :boolean
#  created_at       :datetime
#  updated_at       :datetime
#

class Requirement < ActiveRecord::Base
  belongs_to :requireable, polymorphic: true
  # Type stuff here
end
