class RemoveFlagFromCompanies < ActiveRecord::Migration[6.1]
  def change
    remove_column :companies, :flag, :integer
  end
end
