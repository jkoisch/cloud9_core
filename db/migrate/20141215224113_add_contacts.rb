class AddContacts < ActiveRecord::Migration
  def change

    create_table :contacts do |t|

      t.integer           :cloud9_customer_id
      t.string            :email
      t.boolean           :authorized
      t.boolean           :primary

    end
  end
end
