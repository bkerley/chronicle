class AboutController < ApplicationController
	layout 'public'
	
  def static
		get_abouts
		@post = @abouts.select{|p|p.slug == params[:slug]}.first
  end
	
	private
	def get_abouts
		@abouts = Tag.find_by_title('about').posts.sort{|a,b|a.title <=> b.title} rescue
			raise(ActiveRecord::RecordNotFound, "No posts with that tag")
	end
end
