class AddColumnTower < ActiveRecord::Migration
  def change
    add_column :battalions, :tower, :integer
  end
end
