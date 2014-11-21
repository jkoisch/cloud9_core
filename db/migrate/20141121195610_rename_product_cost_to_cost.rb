class RenameProductCostToCost < ActiveRecord::Migration
  def change

    remove_column :product_costs, :cost
    add_column :product_costs, :amount, :integer

    rename_table :product_costs, :costs

  end
end
