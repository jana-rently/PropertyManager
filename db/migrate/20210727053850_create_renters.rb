class CreateRenters < ActiveRecord::Migration[6.1]
  def change
    create_table :renters do |t|
      

      t.timestamps
    end
  end
end
