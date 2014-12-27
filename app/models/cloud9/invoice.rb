# == Schema Information
#
# Table name: invoices
#
#  id          :integer          not null, primary key
#  state       :integer
#  customer_id :integer
#  total       :integer
#  fail_date   :datetime
#  pay_date    :datetime
#  bill_date   :datetime
#  created_at  :datetime
#  updated_at  :datetime
#

#Cloud9 Invoices are just objects that have sub groups (groups and lines) and are tied to many orders for components.
# Through the orders, we can both manage the building of systems and bill customers for things.
class Cloud9::Invoice < ActiveRecord::Base

  has_many :orders
  has_many :invoice_groups
  has_many :invoice_lines, through: :invoice_groups
  belongs_to :cloud9_customer, :class_name => 'Cloud9::Customer'

  def self.status
    {
        :staged => 100,
        :new => 200,
        :delivered => 300,
        :paid => 400,
        :errored => 500,
        :failed => 999
    }
  end

  def self.status_to_s(number)
    Cloud9::Invoice.status.each { |key,val| return key if val == number }
  end

end
