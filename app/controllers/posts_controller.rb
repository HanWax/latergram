class PostsController < ApplicationController

	before_action :authenticate_user!, except: [:index]

	def index
		@posts = Post.all
	end 

	def create
		@post = Post.new(params[:post].permit(:title, :picture, :tag_list, :address, :like))
		@post.user = current_user
		@post.save
		redirect_to '/'
	end

	def show
		@post = Post.find(params[:id])
	end

	def edit
		@post = Post.find(params[:user_id])
	end 
end
