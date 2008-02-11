class FrontpageController < ApplicationController

  def index
		@posts = Post.find(:all, :order=>'created_at desc', :limit=>5)
  end

  def single
		@post = Post.find_by_slug(params[:slug])
  end
end
