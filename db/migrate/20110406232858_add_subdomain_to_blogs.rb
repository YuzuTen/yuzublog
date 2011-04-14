class AddSubdomainToBlogs < ActiveRecord::Migration
  def self.up
    change_table :blogs do |t|
      t.string :subdomain, :default => nil
    end
  end

  def self.down
    remove_column :blogs, :subdomain
  end
end
