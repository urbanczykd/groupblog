class AddRoleToUsers < ActiveRecord::Migration
  def change
    add_column :users, :role_id, :integer, :after => :id
  end
end
