class Initialize < ActiveRecord::Migration
  def change
    create_table :products do |t|

      t.string :name
      t.text :description
      t.string :invoice_name
      t.text :invoice_description
      t.integer :product_type_id
      t.boolean :active

      t.timestamps
    end

    create_table :product_types do |t|
      t.string :name
      t.text :description
      t.integer :parent_product_type_id
      t.string :invoice_name
      t.text :invoice_description

      t.timestamps
    end

    create_table :product_groups do |t|
      t.string :name
      t.text :description
      t.string :invoice_name
      t.text :invoice_description
      t.boolean :active

      t.timestamps
    end

    create_table :products_groups, id: false do |t|
      t.belongs_to :product_groups
      t.belongs_to :products
    end

    create_table :product_costs do |t|
      t.integer :product_id
      t.integer :cost
      t.boolean :active

      t.timestamps
    end

    create_table :requirements do |t|
      t.references :requireable, polymorphic: true
      t.text :requirement_rule
      t.boolean :active

      t.timestamps
    end

    create_table :product_prices do |t|
      t.integer :product_id
      t.integer :price
      t.boolean :active

      t.timestamps
    end

  end
end
