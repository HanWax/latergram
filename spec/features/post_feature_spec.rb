require 'rails_helper'

describe 'post' do
	context 'no post' do
		it 'shows no post' do
			visit('/')
			expect(page).to have_content('No post yet')
			expect(page).to have_link('Add post')
		end
	end

	context 'with post' do
		it 'shows post' do
			visit('/')
			save_and_open_page
			fill_in 'post_title', with: "bob"
			click_button('Add post')
			expect(page).to have_content('bob')
			expect(page).to have_link('Add post')
		end
	end

	context 'adding images' do 
		it 'uploads an image to the post' do
			visit('/')
			fill_in 'post_title', with: "bob"
			attach_file 'Picture', Rails.root.join('spec/images/bob.jpg')
			click_button('Add post')
			expect(page).to have_content('bob')
			expect(page).to have_css('img.uploaded-pic')
			expect(page).to have_link('Add post')
		end 
	end 
end