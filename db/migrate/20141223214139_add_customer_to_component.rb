class AddCustomerToComponent < ActiveRecord::Migration
  def change

    add_column :components, :customer_id, :integer

  end
end
