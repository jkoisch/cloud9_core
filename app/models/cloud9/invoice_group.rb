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

class Cloud9::InvoiceGroup < ActiveRecord::Base

  belongs_to :invoice
  has_many :invoice_lines

  def initialize(_name, _description)
    self.total = 0
    self.name = _name
    self.description = _description
  end

end
