class CreateBlogAuthors < ActiveRecord::Migration
  def change
    create_table :blog_authors do |t|
      t.integer :user_id
      t.integer :blog_id
      t.integer :role_id

      t.timestamps
    end
  end
end
