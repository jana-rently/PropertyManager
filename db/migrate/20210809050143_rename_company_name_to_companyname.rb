class RenameCompanyNameToCompanyname < ActiveRecord::Migration[6.1]
  def change
    rename_column :companies, :name, :companyname

  end
end
