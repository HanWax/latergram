class PostsController < ApplicationController

	before_action :authenticate_user!, except: [:index]

	def index
		@new_post = Post.new
		@posts = Post.all
	end 

	def create
		@new_post = Post.new(params[:post].permit(:title, :picture))
		@new_post.save
		redirect_to '/'
	end

end
