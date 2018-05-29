class PostCommentsController < ApplicationController

	def create
		post = Post.find(params[:post_id])
		comment = current_user.post_comments.new(post_comment_params)
		comment.post_id = post.id
		comment.save
		redirect_to post_path(post.id)
	end

	def destroy
		post_comment = PostComment.find(params[:id])
		post_comment.destroy
		redirect_to post_path(post_comment.post_id)
		flash[:delete] = "Delete Comment"
	end

private
	def post_comment_params
  	params.require(:post_comment).permit(:user_id, :post_id, :comment)
	end
end
