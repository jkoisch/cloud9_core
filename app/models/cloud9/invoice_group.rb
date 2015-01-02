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

  attr_reader :description, :name, :total

  belongs_to :invoice, :class_name => "Cloud9::Invoice"
  has_many :invoice_lines, :class_name => "Cloud9::InvoiceLine"

  def initialize(options = {})
    super
    self.total = 0
    self.name = options[:name]
    self.description = options[:description]
  end

end
