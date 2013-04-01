class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
      t.integer :user_id
      t.integer :blog_id
      t.integer :owner_id
      t.string  :email
      t.string  :code
      t.boolean :active, :default => true
      t.timestamps
    end
  end
end
