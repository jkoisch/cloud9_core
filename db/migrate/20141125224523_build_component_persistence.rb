class BuildComponentPersistence < ActiveRecord::Migration
  def change
    create_table :components do |t|
      t.integer :product_id
      t.text :notes
      t.integer :system_id

      t.timestamps
    end

    create_table :components_orders, id: false do |t|
      t.belongs_to :component
      t.belongs_to :order
    end

    create_table :systems do |t|
      t.string    :virtual_machine_identifier
      t.text      :raw_data
      t.integer   :customer_id

      t.timestamps
    end

    create_table :systems_users, id: false do |t|
      t.belongs_to :system
      t.belongs_to :user
    end

  end
end
