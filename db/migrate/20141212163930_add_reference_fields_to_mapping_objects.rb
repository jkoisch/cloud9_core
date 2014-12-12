class AddReferenceFieldsToMappingObjects < ActiveRecord::Migration
  def change

    create_table :salesforce_references do |t|
      t.string                  :salesforce_id
      t.string                  :salesforce_url
      t.references              :referenceable, polymorphic: true
      t.timestamps
    end

    create_table :opportunities do |t|
      t.timestamps
    end

    create_table :cases do |t|
      t.timestamps
    end

  end
end
