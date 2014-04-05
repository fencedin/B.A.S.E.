class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :shire_id
      t.string :name

      t.timestamps
    end
  end
end
