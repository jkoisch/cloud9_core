# == Schema Information
#
# Table name: invoice_lines
#
#  id               :integer          not null, primary key
#  invoice_group_id :integer
#  line_total       :integer
#  count            :integer
#  name             :string(255)
#  description      :text
#

class Cloud9::InvoiceLine < ActiveRecord::Base

  belongs_to :invoice_group

end
