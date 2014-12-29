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

require 'rails_helper'

RSpec.describe Cloud9::Invoice, :type => :model do
  before(:all) do
    @invoice = Cloud9::Invoice.new
  end

  #Needs to have several tests here about the status and state
  it "has an initial state" do
    @invoice = Cloud9::Invoice.new
    expect(@invoice.workflow_state).to eq(100)
    expect(@invoice.workflow_state_to_s).to eq("staged")
  end

  it "has an initial total of 0" do
    expect(@invoice.total).to eq(0)
  end

  it "should not have any invoice groups" do
    expect(@invoice.invoice_groups.length).to eq (0)
  end

  it "has a ready status" do
    @invoice.ready
    expect(@invoice.workflow_state).to eq(200)
  end

  it "can be sent to a user" do
    billing_date = @invoice.send_to_user
    expect(@invoice.workflow_state).to eq(300)
    expect(@invoice.bill_date).to eq(billing_date)
  end

  it "can be in an error state" do
    error_date = @invoice.error("Error Condition")
    expect(@invoice.workflow_state).to eq(500)
    expect(@invoice.error_date).to eq(error_date)
    expect(@invoice.notes.include?("Error Condition")).to eq(true)
  end

  it "can be in an failure state" do
    fail_date = @invoice.fail("Fail Condition")
    expect(@invoice.workflow_state).to eq(999)
    expect(@invoice.fail_date).to eq(fail_date)
    expect(@invoice.notes.include?("Fail Condition")).to eq(true)
  end

  it "can be paid" do
    pay_date = @invoice.pay
    expect(@invoice.workflow_state).to eq(400)
    expect(@invoice.pay_date).to eq(pay_date)
  end

  it "can be paid after the status is set to error" do
    error_date = @invoice.error("Error Condition")
    expect(@invoice.workflow_state).to eq(500)
    expect(@invoice.error_date).to eq(error_date)
    expect(@invoice.notes.include?("Error Condition")).to eq(true)

    pay_date = @invoice.pay
    expect(@invoice.workflow_state).to eq(400)
    expect(@invoice.pay_date).to eq(pay_date)
    expect(@invoice.notes.include?("Error Condition")).to eq(true)
    expect(@invoice.notes.include?("THIS INVOICE PAID AND FINALIZED")).to eq(true)
  end

  it "can be paid after the status is set to error with some attached notes" do
    error_date = @invoice.error("Error Condition")
    expect(@invoice.workflow_state).to eq(500)
    expect(@invoice.error_date).to eq(error_date)
    expect(@invoice.notes.include?("Error Condition")).to eq(true)

    pay_date = @invoice.pay("worked it out with the customer")
    expect(@invoice.workflow_state).to eq(400)
    expect(@invoice.pay_date).to eq(pay_date)
    expect(@invoice.notes.include?("Error Condition")).to eq(true)
    expect(@invoice.notes.include?("THIS INVOICE PAID AND FINALIZED")).to eq(true)
    expect(@invoice.notes.include?("worked it out with the customer")).to eq(true)
  end

end
