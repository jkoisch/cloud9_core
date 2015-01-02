class ChangeInvoiceLineCountType < ActiveRecord::Migration
  def change

    remove_column :invoice_lines, :count
    add_column :invoice_lines, :count, :bigint

  end
end
