require File.dirname(__FILE__) + '/../test_helper'

class PostTest < ActiveSupport::TestCase
	load_all_fixtures
	should_have_and_belong_to_many :tags
	should_require_unique_attributes :title, :slug
	should_require_attributes :title, :slug
	
	should_not_allow_values_for :slug, "spaced slug", "slashed/slug", "dotted.slug"
	
	context "An untagged post" do
		before do
			@post = Post.find(:first)
			@tag = Tag.find(:first)
		end
		should "exist" do
			assert @post
		end
		
		should "not have any tags" do
			assert_equal [], @post.tags
		end
		
		should "accept a new tag" do
			@post.tags << @tag
			assert_equal @post.tags.first, @tag
		end
		
		context "when taking a string of new tags" do
			before do
				@post.tag_string = "three test tags"
			end
			
			should "have the appropriate number of tags" do
				assert_equal 3, @post.tags.length
			end
			
			should "dump a tag string containing the tags" do
				%w(three test tags).each do |s|
					assert_match s, @post.tag_string
				end
			end
		end
	end
end
