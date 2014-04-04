class AddSlug < ActiveRecord::Migration
  def change
    add_column :shires, :slug, :string
  end
end
