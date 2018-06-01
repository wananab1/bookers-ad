class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:update, :edit]
  def index
    @users = User.all
    @user = current_user
    @post = Post.new
  end

  def show
    @user = User.find_by_id(params[:id])
    unless @user then
      redirect_to users_path
      flash[:delete] = "Not Found"
    else
      @post = Post.new
      @posts = @user.posts.order(created_at: :desc)
    end
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

  def ensure_correct_user
    if current_user.id != params[:id].to_i
      redirect_to posts_path
      flash[:delete] = "Unauthorized Access"
    end
  end


  private
  	def user_params
  		params.require(:user).permit(:name, :intro, :profile_image)
  	end
end
