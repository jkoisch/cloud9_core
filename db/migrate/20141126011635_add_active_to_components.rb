class AddActiveToComponents < ActiveRecord::Migration
  def change
    add_column :components, :active, :boolean
  end
end
