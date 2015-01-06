class AddSampleToInvoices < ActiveRecord::Migration
  def change
    add_column :invoices, :sample, :boolean
  end
end
