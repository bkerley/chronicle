require File.dirname(__FILE__) + '/../test_helper'

class FrontpageControllerTest < ActionController::TestCase
	def test_should_get_index
		get :index
		assert_response :success
		assert_not_nil assigns(:posts)
	end
	
	def test_should_get_single
		p = Post.find :first
		get :single, :slug=>p.slug
		assert_response :success
		assert_not_nil assigns(:post)
	end
end
