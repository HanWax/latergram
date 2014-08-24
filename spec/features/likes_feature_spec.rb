require 'rails_helper'

describe 'liking posts' do 
	before do 
		post = Post.create(title: 'bob', tag_list: '#bob, #amazing')
	end 

	it 'can like a post, updating the post like count', js: true do 
		visit '/'
		click_link '❤'
		expect(page).to have_content('1 ❤')
	end 

end