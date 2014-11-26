class CreateSystemMetrics < ActiveRecord::Migration
  def change
    create_table :measurements do |t|
      t.integer         :system_id
      t.text            :raw_metric_data
      t.integer         :ram
      t.integer         :cpu
      t.integer         :hard_drive_space
      t.integer         :per_user_ram_utilization

      t.timestamps
    end

    add_column :components, :quantity, :bigint

    add_column :products, :required_quantity, :bigint
  end
end
