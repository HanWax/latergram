require 'rails_helper'

describe 'tagging posts' do 

	before(:each) do 
			alex = User.create(email: "a@a.com", username: 'bob', password: "123456789", password_confirmation: "123456789")
			login_as("a@a.com", 'bob', "123456789")
	end

	context 'displaying tags' do 
		it 'displays tags as links under posts' do 
			visit('/')
			fill_in 'post_tag_list', with: '#yolo, #swag'
			click_button 'Add post'
			expect(page).to have_link('#yolo')
			expect(page).to have_link('#swag')
		end  
	end 

end 

describe 'filtering by tags' do 
	before do 
		Post.create(title: 'Amazon Bob', tag_list: '#amazon, #bob')
		Post.create(title: 'Amazing Bob', tag_list: '#bob')
	end 

	context 'displaying tagged posts' do 
		it 'filters to show only tagged posts' do 
			visit '/'
			click_link '#amazon'
			expect(page).to have_css 'h1', text: 'Posts tagged with:'
			expect(page).to have_content 'Amazon Bob'
			expect(page).not_to have_content 'Amazing Bob'
		end 
	end 
end 