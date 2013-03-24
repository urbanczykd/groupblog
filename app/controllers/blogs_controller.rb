class BlogsController < ApplicationController
  layout 'blog'

  def show
    @blog = Blog.find_by_slug!(request.subdomain)
  end
  
end
