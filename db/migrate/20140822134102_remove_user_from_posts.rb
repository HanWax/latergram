class RemoveUserFromPosts < ActiveRecord::Migration
  def change
    remove_column :posts, :user, :text
  end
end
