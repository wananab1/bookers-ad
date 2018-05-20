class PostsController < ApplicationController

	before_action :authenticate_user!, except: [:top, :about]

	def top
	end

	def about
	end

	def create
		@post = Post.new(post_params)
		@post.user_id = current_user.id

		if @post.save
			redirect_to posts_path
		else
			@posts = Post.all
			@user = current_user
			render "posts/index"
		end
	end

	def index
		@posts = Post.all
		@post = Post.new
		@user = current_user
	end

	def show
		@post_show = Post.find(params[:id])
		@user = current_user
		@post = Post.new
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
		post = Post.find(params[:id])
		if post.update(post_params)
			redirect_to posts_path
		else
			@post = Post.find(params[:id])
			render "posts/edit"
		end

	end

	def destroy
		post = Post.find(params[:id])
		post.destroy
		redirect_to posts_path
	end

	private
		def post_params
			params.require(:post).permit(:title, :opinion, :user_id)
		end
end
