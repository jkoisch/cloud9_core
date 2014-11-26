# == Schema Information
#
# Table name: orders
#
#  id         :integer          not null, primary key
#  notes      :text
#  created_at :datetime
#  updated_at :datetime
#  invoice_id :integer
#

class Cloud9::Order < ActiveRecord::Base

  has_and_belongs_to_many :cloud9_components, :class_name => 'Cloud9::Component'
  belongs_to :cloud9_invoice, :class_name => 'Cloud9::Invoice'

end
