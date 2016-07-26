class PostsController < ApplicationController
  
	before_action :authenticate_user!, only: [ :create, :index, :destroy ]

  def index
  	@posts = Post.all
  	
  	@post = current_user.posts.build
  	
  end


  def new
  	@post = current_user.posts.build
  end

  def create
  	@post = current_user.posts.build(post_params)
  	if @post.save
  		redirect_to posts_path
  	else
  		render 'new'
  	end
  end

  def destroy
  	@post = Post.find(params[:id])
  	if current_user==@post.user
  		@post.destroy
  		flash[:success] = "Post deleted"
  		redirect_to posts_path
  	else
  		flash[:error] = "You can't delete the post"
  		redirect_to posts_path
  	end

  end




  private

  def post_params
  	params.require(:post).permit(:content)
  end

end
