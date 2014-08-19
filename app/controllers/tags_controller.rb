class TagsController < ApplicationController
	def show
		@tags = Tag.find_by!(text: '#' + params[:id])
	end 
end
