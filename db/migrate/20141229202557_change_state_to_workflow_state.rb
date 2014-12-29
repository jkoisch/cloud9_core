class ChangeStateToWorkflowState < ActiveRecord::Migration
  def change

    remove_column :invoices, :state
    add_column :invoices, :workflow_state, :integer

  end
end
