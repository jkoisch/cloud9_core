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

  it "has customer information available" do
    cust = build(:customer)


  end

  it "reflects prices of systems" do

  end

  it "reflects prices of components that are not attached to any  system" do

  end

  it "reflects one or more orders for a customer" do

  end

end
