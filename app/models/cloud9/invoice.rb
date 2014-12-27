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
        :ready => 200,
        :sent => 300,
        :paid => 400,
        :errored => 500,
        :failed => 999
    }
  end

  def self.status_to_s(number)
    Cloud9::Invoice.status.each { |key,val| return key if val == number }
  end

  def stage
    self.state = Cloud9::Invoice.status[:staged]
  end

  def ready
    self.state = Cloud9::Invoice.status[:ready]
  end

  def send
    self.state = Cloud9::Invoice.status[:sent]
    self.bill_date = Time.now
    self.due_date = 2.weeks.from_now
  end

  def pay
    self.state = Cloud9::Invoice.status[:paid]
    self.pay_date = Time.now
  end

  def error(notes)
    self.state = Cloud9::Invoice.status[:errored]
    self.notes += notes
  end

  def fail(notes)
    self.state = Cloud9::Invoice.status[:failed]
    self.notes += notes
    self.fail_date = Time.now
  end

end
