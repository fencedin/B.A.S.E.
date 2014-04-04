class UpdateColumnNamesInf < ActiveRecord::Migration
  def change
    rename_column :battalions, :footmen, :footman
    rename_column :battalions, :knights, :knight
    rename_column :battalions, :wizards, :wizard
  end
end
