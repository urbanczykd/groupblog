class HomeController < ApplicationController
layout 'blog'

  def show
      #   return render :text => request.subdomain
    @blog = Blog.find_by_slug!(request.subdomain)
    @posts = @blog.posts.order("created_at DESC")

  end

  def index
  end

  def posts
  end

end
