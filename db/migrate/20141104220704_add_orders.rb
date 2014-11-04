class AddOrders < ActiveRecord::Migration
  def change

    create_table :orders do |t|
      t.text :notes
      t.timestamps
    end

    create_table :orders_products do |t|
      t.belongs_to :product
      t.belongs_to :order
    end

  end
end
