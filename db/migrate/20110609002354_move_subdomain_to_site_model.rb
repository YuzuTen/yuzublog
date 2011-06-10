class MoveSubdomainToSiteModel < ActiveRecord::Migration
  def self.up
    Blog.find(:all).each do |blog|
      puts blog.subdomain
      blog.site=Site.new( :hostname => "#{blog.subdomain}.yuzuten.com" )
      blog.save
    end

    remove_column :blogs, :subdomain
  end

  def self.down
    #I think I'm the only person dependent on this migration. It's not very careful.
    add_column :blogs, :subdomain, :string

    Site.find(:all).each do |site|
      unless site.hostname.empty?
        hostname=site.hostname
        subdomain_guess=hostname.match(/[\w\d-]+/).to_s
        site.subdomain=subdomain_guess
        site.save
      end
    end
  end
end
