class CreatePosts < ActiveRecord::Migration
  def self.up
    create_table :posts do |t|
      t.string :title
      t.text :story
      t.date :publish_on

      t.timestamps
    end
  end

  def self.down
    drop_table :posts
  end
end
