class AddCloud9IdentifierToCustomer < ActiveRecord::Migration
  def change
    add_column :customers, :cloud9_identifier, :string
  end
end
