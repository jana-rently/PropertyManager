class RemoveAgentIdFromProperties < ActiveRecord::Migration[6.1]
  def change
    remove_column :properties, :agent_id, :integer
  end
end
