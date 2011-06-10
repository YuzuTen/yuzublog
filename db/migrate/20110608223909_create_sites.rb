class CreateSites < ActiveRecord::Migration
  def self.up
    create_table :sites do |t|
      t.string :hostname

      t.timestamps
    end
    
    add_column :blogs, :site_id, :integer


  end

  def self.down
    drop_table :sites

    remove_column :blogs, :site_id
  end
end
