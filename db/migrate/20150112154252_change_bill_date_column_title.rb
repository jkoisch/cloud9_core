class ChangeBillDateColumnTitle < ActiveRecord::Migration
  def change

    remove_column :customers, :billing_date
    add_column :customers, :billing_date_base, :date

  end
end
