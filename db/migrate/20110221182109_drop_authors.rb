class DropAuthors < ActiveRecord::Migration
  def self.up
    drop_table "authors"
  end

  def self.down
    create_table :authors do |t|
      t.string :name

      t.timestamps
    end
  end
end
