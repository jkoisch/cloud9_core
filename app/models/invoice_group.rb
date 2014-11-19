# == Schema Information
#
# Table name: invoice_groups
#
#  id          :integer          not null, primary key
#  total       :integer
#  invoice_id  :integer
#  name        :string(255)
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#

class InvoiceGroup < ActiveRecord::Base

  belongs_to :invoice
  has_many :invoice_groups

end
