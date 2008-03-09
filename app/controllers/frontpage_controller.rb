class FrontpageController < ApplicationController
	layout 'public'
  def index
		@posts = Post.find(:all, :order=>'created_at desc', :limit=>5)
  end
	
	def date
		@posts = Post.find(:all, :order=>'created_at desc')
	end
	
	def one_tag
		@posts = Tag.find_by_title(params[:tag]).posts
		render :template=>'frontpage/index'
	end
	
	def tags
		tags = Tag.find(:all, :order=>'title asc')
		@tag_cloud = tags.select{|t| t.posts.length > 0}.map{|t| {:title=>t.title, :count=>t.posts.length}}
	end
	
  def single
		@post = Post.find_by_slug(params[:slug])
  end
end
