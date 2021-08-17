class AddApiTokenToAgents < ActiveRecord::Migration[6.1]
  def change
    add_column :agents, :api_token, :string
  end
end
