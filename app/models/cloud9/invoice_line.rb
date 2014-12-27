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

  def initialize(_name, _description, _count, _item)
    self.name = _name
    self.description = _description
    self.count = _count
    self.line_total = _item
  end

  def self.create_from(comp)
    unless comp.blank?
      this_line = Cloud9::InvoiceLine.new(
          comp.product.invoice_name,
          comp.product.invoice_description,
          comp.quantity,
          comp.invoice_price
      )
    end
    this_line
  end

end
