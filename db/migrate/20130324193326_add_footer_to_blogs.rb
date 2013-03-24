class AddFooterToBlogs < ActiveRecord::Migration
  def change
    add_column :blogs, :footer, :text
  end
end
