require 'rails_helper'

describe 'menu display' do
	context 'if logged out' do
		it 'display sign in' do
			visit('/')
		expect(page).to have_content('Sign in')
		end

		it 'display sign up' do
			visit('/')
		expect(page).to have_content('Sign up')
		end

	end

	context 'if logged in' do
		before(:each) do 
			alex = User.create(email: "a@a.com", username: 'bob', password: "123456789", password_confirmation: "123456789")
			login_as("a@a.com", 'bob', "123456789")
		end 

		it 'display sign out' do
			visit('/')
			save_and_open_page
			expect(page).to have_content('Sign out')
		end
	end

end