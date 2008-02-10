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
		
		should "accept a new tag from a string" do
			@post.tag_string = "three test tags"
			assert_equal 3, @post.tags.length
		end
	end
end
