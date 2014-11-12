# == Schema Information
#
# Table name: orders
#
#  id         :integer          not null, primary key
#  notes      :text
#  created_at :datetime
#  updated_at :datetime
#

class Order < ActiveRecord::Base

  has_and_belongs_to_many :products
  belongs_to :invoice

end
