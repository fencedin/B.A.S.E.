class CreateShires < ActiveRecord::Migration
  def change
    create_table :shires do |t|
      t.string :name
      t.integer :gold

      t.timestamps
    end
  end
end
