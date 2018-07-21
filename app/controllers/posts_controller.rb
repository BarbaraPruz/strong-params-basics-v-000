class PostsController < ApplicationController
	def index
		@posts = Post.all
	end

	def show
		@post = Post.find(params[:id])
	end

	def new
		@post = Post.new
	end

	# In this code, create slightly different (for required, permitted) than update.
	# If both the same, it can be simplified (see below with helper method)
	# def create
	# 	@post = Post.new(params.require(:post).permit(:title, :description))
	# 	@post.save
	# 	redirect_to post_path(@post)
	# end
	# 
	# def update
	# 	@post = Post.find(params[:id])
	#   @post.update(params.require(:post).permit(:title))
	#   redirect_to post_path(@post)
	# end
	def create
		@post = Post.new(post_params)
	  @post.save
		redirect_to post_path(@post)
	end
		 
	def update
	  @post = Post.find(params[:id])
	  @post.update(post_params)
	  redirect_to post_path(@post)
	end
	  
	def edit
	  @post = Post.find(params[:id])
	end

	private
	 
	def post_params
	  params.require(:post).permit(:title, :description)
	end
end
