class AlterUsersAddFields < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      t.string :display_name, :default => nil
      t.string :family_name, :default => nil
      t.string :given_name, :default => nil
    end
  end

  def self.down
    remove_column :users, :display_name
    remove_column :users, :family_name
    remove_column :users, :given_name
  end
end
