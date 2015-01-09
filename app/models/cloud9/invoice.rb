# == Schema Information
#
# Table name: invoices
#
#  id             :integer          not null, primary key
#  customer_id    :integer
#  total          :integer
#  fail_date      :datetime
#  pay_date       :datetime
#  bill_date      :datetime
#  created_at     :datetime
#  updated_at     :datetime
#  notes          :text
#  error_date     :datetime
#  workflow_state :integer
#  sample         :boolean
#

#Cloud9 Invoices are just objects that have sub groups (groups and lines) and are tied to many orders for components.
# Through the orders, we can both manage the building of systems and bill customers for things.
class Cloud9::Invoice < ActiveRecord::Base

  attr_accessor :total
  attr_reader :workflow_status

  has_many :orders
  has_many :invoice_groups, :class_name => "Cloud9::InvoiceGroup"
  has_many :invoice_lines, through: :invoice_groups, :class_name => "Cloud9::InvoiceLine"
  belongs_to :customer, :class_name => 'Cloud9::Customer'

  after_initialize :stage

  def self.status
    {
        :staged => 100,
        :ready => 200,
        :sent => 300,
        :paid => 400,
        :errored => 500,
        :sampled => 700,
        :failed => 999
    }
  end

  def workflow_state_to_s
    Cloud9::Invoice.status.each { |key,val| return key.to_s if val == self.workflow_state }
  end

  def stage
    update_status(Cloud9::Invoice.status[:staged]) if self.workflow_state.nil?
  end

  def ready
    update_status(Cloud9::Invoice.status[:ready])
  end

  def sample
    update_status(Cloud9::Invoice.status[:sampled])
  end

  def send_to_user
    update_status(Cloud9::Invoice.status[:sent]) do
      self.bill_date = Time.now
    end
  end

  def pay(_notes = nil)
    update_status(Cloud9::Invoice.status[:paid]) do
      addend_payment_reason(_notes)
      self.pay_date = Time.now
    end
  end

  def error(notes)
    update_status(Cloud9::Invoice.status[:errored], notes) do
      self.error_date = Time.now
    end
  end

  def fail(notes)
    update_status(Cloud9::Invoice.status[:failed], notes) do
      self.fail_date = Time.now
    end
  end

  self.class_eval do
    %w[components systems].each do |key|

      define_method(key) do
        if instance_variable_defined?("@#{key}")
          instance_variable_get("@#{key}")
        else
          instance_variable_set("@#{key}", [])
        end
      end

      define_method("#{key}s<<") do |val|
        eval("@#{key} << #{val}")
      end

    end
  end

  private

  def update_status(_status, _notes = nil)
    self.workflow_state = _status
    addend_notes(_notes) if _notes.present?
    yield if block_given?
  end

  def addend_notes(_notes)
    if self.notes.blank?
      self.notes = stamp_note(_notes)
    else
      self.notes += ";  #{stamp_note(_notes)}"
    end
  end

  def addend_payment_reason(_notes)
    if self.notes.present?
      addend_notes("#{_notes unless _notes.nil?} ... THIS INVOICE PAID AND FINALIZED")
    end
  end

  def stamp_note(_notes)
    "(" + Time.now.to_s + ") #{_notes}"
  end

end
