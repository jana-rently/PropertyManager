class RemoveAuthenticationTokenFromAgents < ActiveRecord::Migration[6.1]
  def change
    remove_column :agents, :authentication_token, :string
  end
end
