class AddInvoices < ActiveRecord::Migration
  def change

    create_table :invoices do |t|
      t.integer :state
      t.integer :customer_id
      t.integer :total
      t.datetime :fail_date
      t.datetime :pay_date
      t.datetime :bill_date

      t.timestamps
    end

    add_column :orders, :invoice_id, :integer

    create_table :invoice_groups do |t|
      t.integer :total
      t.integer :invoice_id
      t.string :name
      t.text :description

      t.timestamps
    end

    create_table :invoice_lines do |t|
      t.integer :invoice_group_id
      t.integer :line_total
      t.integer :count
      t.string :name
      t.text :description
    end

  end
end
