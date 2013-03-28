class BlogsController < ApplicationController

  # def show
  #   return render :text => request.subdomain
  #   @blog = Blog.find_by_slug!(request.subdomain)

  # end

  def index
    @blogs = Blog.where(:owner_id => params[:user_id])
  end

  def show
    @blog = Blog.find(params[:id])
    @posts = @blog.posts.order("created_at DESC")
  end

  def new
    @blog = User.find(params[:user_id]).blogs.build
  end

  def create
    @user = User.find(params[:user_id])
    @blog = Blog.new(params[:blog])
    @blog.owner = current_user
    respond_to do |format|
      if @blog.valid?
        @blog = @user.blogs << @blog
        format.html { redirect_to user_blogs_path(current_user), notice: 'Post was successfully created.' }
        format.json { render json: @blog, status: :created, location: @blog }
      else
        format.html { render action: "new" }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy

    respond_to do |format|
      format.html { redirect_to user_blogs_url, notice: "Blog deleted successfully" }
      format.json { head :no_content }
    end
  end


end
