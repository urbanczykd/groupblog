class AddOwnerIdToBlogs < ActiveRecord::Migration
  def change
    add_column :blogs, :owner_id, :integer
  end
end
