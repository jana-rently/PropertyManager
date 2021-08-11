class AddCompanyToProperty < ActiveRecord::Migration[6.1]
  def change
    add_reference :properties, :company, null: false, foreign_key: true
  end
end
