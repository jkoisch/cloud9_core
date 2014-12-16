class AddNameFieldToContact < ActiveRecord::Migration
  def change

    add_column :contacts, :name, :string
    add_column :contacts, :role, :string

    remove_column :customers, :email
    remove_column :customers, :first_name
    remove_column :customers, :last_name
    remove_column :customers, :role
  end
end
