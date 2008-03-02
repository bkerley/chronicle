class FrontpageController < ApplicationController
	layout 'public'
  def index
		@posts = Post.find(:all, :order=>'created_at desc', :limit=>5)
  end
	
	def date
		
	end
	
	def tags
		@tags = Tag.find(:all)
	end
	
  def single
		@post = Post.find_by_slug(params[:slug])
  end
end
