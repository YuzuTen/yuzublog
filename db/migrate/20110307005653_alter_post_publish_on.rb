class AlterPostPublishOn < ActiveRecord::Migration
  def self.up
    change_column :posts, :publish_on, :datetime
  end

  def self.down
    change_column :posts, :publish_on, :date
  end
end
