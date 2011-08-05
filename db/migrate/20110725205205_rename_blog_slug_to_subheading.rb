class RenameBlogSlugToSubheading < ActiveRecord::Migration
  def up
    rename_column :blogs, :slug, :subheading
  end

  def down
    rename_column :blogs, :subheading, :slug
  end
end
