class CreateBattalions < ActiveRecord::Migration
  def change
    create_table :battalions do |t|
      t.integer :footmen
      t.integer :archer
      t.integer :knights
      t.integer :wizards
      t.timestamps
    end
  end
end
