require File.dirname(__FILE__) + '/../test_helper'

class TagTest < ActiveSupport::TestCase
	should_have_and_belong_to_many :post
	
	should_require_unique_attributes :title
	should_require_attributes :title
end
