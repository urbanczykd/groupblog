class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.integer :author_id
      t.string :name
      t.string :slug

      t.timestamps
    end
  end
end
