class AddLicenses < ActiveRecord::Migration
  def change

    create_table :product_licenses do |t|
      t.integer :product_id
      t.integer :region
      t.integer :description

      t.timestamps
    end

  end
end
