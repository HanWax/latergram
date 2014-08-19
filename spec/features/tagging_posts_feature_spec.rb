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
			expect(page).to have_link('#swag')
			expect(page).to have_link('#yolo')
		end  
	end 
end 