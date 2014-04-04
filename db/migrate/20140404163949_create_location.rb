class CreateLocation < ActiveRecord::Migration
  def change
    create_table :locations do |t|
    t.integer :shire_id
    t.integer :battalion_id
    end
  end
end
