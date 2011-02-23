class BlogsUsers < ActiveRecord::Migration
  def self.up
    create_table :blogs_users, :id => false do |t|
      t.references :blog
      t.references :user
    end
    add_index :blogs_users, :blog_id
  end

  def self.down
    drop_table :blogs_users
  end
end
