class AddStateToPostsAndComments < ActiveRecord::Migration
  def change
    add_column :posts, :aasm_state, :string
    add_column :comments, :aasm_state, :string
  end
end
