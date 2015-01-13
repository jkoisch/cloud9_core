class AddArchiveFlagToInvoices < ActiveRecord::Migration
  def change

    add_column :invoices, :archived, :boolean


  end
end
