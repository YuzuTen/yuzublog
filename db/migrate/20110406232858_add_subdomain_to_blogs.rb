class AddSubdomainToBlogs < ActiveRecord::Migration
  def self.up
    add_column :blogs, :subdomain, :string, :default => nil
  end

  def self.down
    remove_column :blogs, :subdomain
  end
end
