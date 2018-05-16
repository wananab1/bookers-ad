class PostsController < ApplicationController
	before_action :authenticate_user!
	def top
		
	end

	def create
		@post = Post.new(post_params)
		@post.user_id = current_user.id
		@post.save
		redirect_to posts_path
	end

	def index
		@posts = Post.all
		@post = Post.new
	end

	def show
		
	end

	private
		def post_params
			params.require(:post).permit(:title, :opinion, :user_id)
		end

end
