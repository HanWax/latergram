def login_as(email, username, password)
	visit ('/users/sign_in')
	expect(current_path).to eq new_user_session_path
	fill_in 'user_email', with: email
	fill_in 'user_username', with: username
	fill_in 'user_password', with: password
	click_button 'Log in'
end 