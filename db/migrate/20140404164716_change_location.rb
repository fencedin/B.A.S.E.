class ChangeLocation < ActiveRecord::Migration
  def change
    rename_table :locations, :battalions_shires
  end
end
