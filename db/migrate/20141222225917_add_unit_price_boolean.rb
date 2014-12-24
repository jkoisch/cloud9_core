class AddUnitPriceBoolean < ActiveRecord::Migration
  def change

    add_column :products, :unit_price, :boolean

  end
end
