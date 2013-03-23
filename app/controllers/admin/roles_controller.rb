class Admin::RolesController < AdminController

  def index
    @roles = Role.all
  end
  
end
