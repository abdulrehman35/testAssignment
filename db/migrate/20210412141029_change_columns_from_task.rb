class ChangeColumnsFromTask < ActiveRecord::Migration[6.1]
  def change
    add_column :tasks, :aasm_state, :string

    remove_column :tasks, :status, :string
  end
end
