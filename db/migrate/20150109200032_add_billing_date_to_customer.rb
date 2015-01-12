class AddBillingDateToCustomer < ActiveRecord::Migration
  def change

    add_column :customers, :billing_date, :date
    add_column :customers, :billing_frequency, :string

  end
end
