class PostSweeper < ActionController::Caching::Sweeper
	observe Post # This sweeper is going to keep an eye on the Post model

	# If our sweeper detects that a Post was created call this
	def after_create(post)
		expire_cache_for(post)
	end

	# If our sweeper detects that a Post was updated call this
	def after_update(post)
		expire_cache_for(post)
	end

	# If our sweeper detects that a Post was deleted call this
	def after_destroy(post)
		expire_cache_for(post)
	end

	private
	def expire_indices
		actions = [:index, :date, :tags]
		actions.each { |a| expire_page :controller=>'frontpage', :action=>a.to_s}
		Tag.find(:all).each { |t| expire_page :controller=>'frontpage', :action=>'one_tag', :tag=>t.title}
	end
	
	def expire_feeds
		formats = ['html', 'atom', 'xml']
		formats.each { |a| expire_page :controller=>'posts', :action=>'index', :format=>a}
	end
	
	def expire_abouts
		abouts = Tag.find_by_title('about').posts
		abouts.each { |a| expire_page :controller=>'about', :action=>'static', :slug=>a.slug}
	end
	
	def expire_cache_for(record)
		expire_page(:controller=>'frontpage', :action=>'single', :slug=>record.slug)
		expire_indices
		expire_feeds
		expire_abouts
	end
end