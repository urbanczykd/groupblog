class Admin::BlogsController < AdminController

  def index
    @blogs = Blog.all
  end
end
