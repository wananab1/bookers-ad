class PostsController < ApplicationController

	before_action :authenticate_user!, except: [:top, :about]
	before_action :ensure_correct_post_user, only: [:update, :edit, :destroy]
	def top
	end

	def about
	end

	def create
		@post = Post.new(post_params)
		@post.user_id = current_user.id

		if @post.save
			redirect_to posts_path
			flash[:newpost] = "New Post !!"
		else
			@posts = Post.all
			@user = current_user
			render "posts/index"
		end
	end

	def index
		@posts = Post.all.order(created_at: :desc)
		@post = Post.new
		@user = current_user
	end

	def show
		@post_show = Post.find_by_id(params[:id])
		@user = current_user
		@post = Post.new
		@post_comment = PostComment.new
		@comments = @post_show.post_comments
		unless @post_show then
			redirect_to posts_path
			flash[:delete] = "Not Found"
		end
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])
		if @post.update(post_params)
			redirect_to post_path(@post)
		else
			render "posts/edit"
		end

	end

	def destroy
		post = Post.find(params[:id])
		post.destroy
		redirect_to posts_path
		flash[:delete] = "Delete Post"
	end

	def ensure_correct_post_user
     	@post = Post.find(params[:id])
    	if current_user.id != @post.user_id
      	redirect_to posts_path
      	flash[:delete] = "Unauthorized Access"
    	end
  	end


	private
		def post_params
			params.require(:post).permit(:title, :opinion, :user_id, :score)
		end
end
