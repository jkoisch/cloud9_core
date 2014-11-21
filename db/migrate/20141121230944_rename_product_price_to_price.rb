class RenameProductPriceToPrice < ActiveRecord::Migration
  def change

    rename_table :product_prices, :prices

    remove_column :prices, :price
    add_column :prices, :amount, :integer

  end
end
