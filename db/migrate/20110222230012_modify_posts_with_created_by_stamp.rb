class ModifyPostsWithCreatedByStamp < ActiveRecord::Migration
  def self.up
    change_table :posts do |t|
      t.integer :created_by_id
      t.integer :updated_by_id
#missed this before
      t.integer :blog_id
    end
  end

  def self.down
    remove_column :posts, :created_by_id
    remove_column :posts, :updated_by_id
    remove_column :posts, :blog_id
  end
end
