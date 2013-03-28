class HomeController < ApplicationController
layout 'blog'

  def show
    @blog = Blog.find_by_slug!(request.subdomain)
    @posts = @blog.posts.order("created_at DESC")
  end

  def index
  end

  def posts
  end

  def create_comment
    @post = Post.find_by_id(params[:post_id])
    if @post.comments.create(params[:comment])
      redirect_to root_path, :flash => {:message => "Comment added"}
    else
      redirect_to root_path, :flash => {:notice => "failed"}
    end
  end

end
