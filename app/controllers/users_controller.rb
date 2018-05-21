class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:update, :edit]
  def index
    @users = User.all
    @user = current_user
    @post = Post.new
  end

  def show
    @post = Post.new
  	@user = User.find(params[:id])
  	@posts = @user.posts
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])

    if @user.update(user_params)
  	  redirect_to user_path(@user.id)
    else
      render 'users/edit'
    end
  end


  private
  	def user_params
  		params.require(:user).permit(:name, :intro, :profile_image)
  	end
end
