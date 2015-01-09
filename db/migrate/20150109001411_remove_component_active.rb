class RemoveComponentActive < ActiveRecord::Migration
  def change

    remove_column :components, :active

  end
end
