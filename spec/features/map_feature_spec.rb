require 'rails_helper'

describe 'maps' do 

	before do 
		Post.create(address: 'London')
	end 

	it 'displays a map when the location is clicked', js: true do
		visit '/'
		click_link 'London'
		expect(page).to have_css '.gm-style'
	end 
end