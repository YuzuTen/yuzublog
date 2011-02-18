class CreateBlogs < ActiveRecord::Migration
  def self.up
    create_table :blogs do |t|
      t.string :name
      t.string :slug
      t.string :domain
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :blogs
  end
end
