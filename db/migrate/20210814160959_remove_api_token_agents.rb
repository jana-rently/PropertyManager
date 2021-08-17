class RemoveApiTokenAgents < ActiveRecord::Migration[6.1]
  def change
    remove_column :agents, :api_token, :string
  end
end
