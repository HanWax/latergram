require 'rails_helper'

RSpec.describe Tag, :type => :model do

  describe '#tag_list=' do 

  	let(:post) { Post.create(title: 'Amazon Bob')}

	  	context 'no tags provided' do 
	  		it 'gives no tags to the post' do 
	  			post.tag_list= ""
	  			expect(post.tags).to be_empty
	  		end 
	  	end

	  	context 'with one tag provided' do 
	  		it 'add that tag to our post' do 
	  			post.tag_list = '#bob'
	  			expect(post.tags.first.text).to eq '#bob'
	  		end 
	  	end

	  	context 'with multiple tags provided' do 
	  		it 'adds those tags to our post separately' do 
	  			post.tag_list = '#bob, #amazon'
	  			expect(post.tags.count).to eq 2
	  		end 
	  	end 

	  	context 'with existing tags' do 
	  		before {Tag.create(text: '#bob')}

	  		it 'should be able to reuse tags' do 
	  			post.tag_list = '#bob, #amazon'
		  		expect(post.tags.count).to eq 2
		  	end 
	  	end 
  end 
  	



end