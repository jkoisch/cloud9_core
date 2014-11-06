class AddCustomerAndUser < ActiveRecord::Migration
  def change

    create_table :customers do |t|
      t.string :first_name
      t.string :last_name
      t.string :organization_name
      t.string :role
      t.string :email

      t.timestamps
    end

    create_table :users do |t|

    end

  end
end
