class FrontpageController < ApplicationController
	layout 'public'
  def index
		@posts = Post.find(:all, :order=>'created_at desc', :limit=>5)
  end
	
	def date
		@posts = Post.find(:all, :order=>'created_at desc')
		self.title = "Archive"
	end
	
	def one_tag
		@posts = Tag.find_by_title(params[:tag]).posts.find(:all, :order=>'created_at desc') rescue
			raise(ActiveRecord::RecordNotFound, "No posts with that tag")
		self.title = "Posts tagged #{params[:tag]}"
		render :template=>'frontpage/index'
	end
	
	def tags
		tags = Tag.find(:all, :order=>'title asc')
		@tag_cloud = tags.select{|t| t.posts.length > 0}.map{|t| {:title=>t.title, :count=>t.posts.length}}
		self.title = "Tags"
	end
	
  def single
		@post = Post.find_by_slug(params[:slug]) or 
			raise( ActiveRecord::RecordNotFound, "No posts with that slug" )
		self.title = @post.title
		respond_to do |format|
			format.html
		end
		
  end
end