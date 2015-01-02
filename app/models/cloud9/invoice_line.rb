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

  attr_reader :name, :description, :line_total, :count

  belongs_to :invoice_group, :class_name => "Cloud9::InvoiceGroup"

  def initialize(options = {})
    super
    @name = options[:name]
    @description = options[:description]
    @count = options[:count]
    @line_total = options[:line_total]
  end

  def self.create_from(comp)
    unless comp.blank?
      this_line = Cloud9::InvoiceLine.new(
          :name => comp.product.invoice_name,
          :description => comp.product.invoice_description,
          :count => comp.quantity,
          :line_total => comp.invoice_price
      )
    end
    this_line
  end

end
