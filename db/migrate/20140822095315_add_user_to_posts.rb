class AddUserToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :user, :text
  end
end
