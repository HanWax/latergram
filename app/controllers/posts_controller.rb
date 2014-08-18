class PostsController < ApplicationController
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
