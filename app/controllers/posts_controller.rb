class PostsController < ApplicationController
	before_action :authenticate_user!
	def create

	end

	def index
		@users = User.all
	end

	def show
		
	end

end
