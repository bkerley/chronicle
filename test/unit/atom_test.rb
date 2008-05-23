require File.dirname(__FILE__) + '/../test_helper'

class AtomTest < ActiveSupport::TestCase
  should_require_attributes :url, :name
	should_require_unique_attributes :url, :name
end
