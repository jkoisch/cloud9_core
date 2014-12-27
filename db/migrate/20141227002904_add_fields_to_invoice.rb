class AddFieldsToInvoice < ActiveRecord::Migration
  def change

    add_column :invoices, :notes, :text
    add_column :invoices, :error_date, :datetime

  end
end
