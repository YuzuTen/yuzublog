class RemoveDomainFromBlog < ActiveRecord::Migration
  def self.up
    remove_column :blogs, :domain
  end

  def self.down
    add_column :blogs, :domain, :string
  end
end
