class Renameflag < ActiveRecord::Migration[6.1]
  def change
      rename_column :properties, :flag, :rented
  end
end

