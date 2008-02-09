require File.dirname(__FILE__) + '/../test_helper'

class PostTest < ActiveSupport::TestCase
	load_all_fixtures
	
	should_have_and_belong_to_many :tag
	should_require_unique_attributes :title, :slug
	should_require_attributes :title, :slug
	
	should_not_allow_values_for :slug, "spaced slug", "slashed/slug", "dotted.slug"
end
