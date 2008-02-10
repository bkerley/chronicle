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
			puts @post.inspect
		end
		should "exist" do
			assert @post
		end
		
		should "not have any tags" do
			assert_equal [], @post.tags
		end
	end
end
