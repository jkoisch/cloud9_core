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
    update_status(:staged)
  end

  def ready
    update_status(:ready)
  end

  def send_to_user
    update_status(:sent) do
      self.bill_date = Time.now
    end
  end

  def pay
    update_status(:paid) do
      self.pay_date = Time.now
    end
  end

  def error(notes)
    update_status(:errored, notes)
  end

  def fail(notes)
    update_status(:failed, notes) do
      self.fail_date = Time.now
    end
  end

  private

  def update_status(_status, notes = nil)
    self.state = Cloud9::Invoice.status[_status]
    addend_notes(notes) if notes.present?
    yield if block_given?
  end

  def addend_notes(_notes)
    if self.notes.blank?
      self.notes = stamp_note(_notes)
    else
      self.notes = self.notes + "; " + stamp_note(_notes)
    end
  end

  def stamp_note(_notes)
    "(" + Time.now.to_s + ") #{_notes}"
  end

end
