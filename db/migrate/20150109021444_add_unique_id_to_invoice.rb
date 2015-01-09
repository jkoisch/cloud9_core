class AddUniqueIdToInvoice < ActiveRecord::Migration
  def change
    add_column :invoices, :external_id, :string
  end
end
