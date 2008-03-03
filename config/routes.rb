ActionController::Routing::Routes.draw do |map|
	map.resources :tags
	
	map.resources :posts
	
	map.frontpage '', :controller=>'frontpage', :action=>'index', :page=>1
	map.archive 'page/:page', :controller=>'frontpage', :action=>'index'
	map.single 'post/:slug', :controller=>'frontpage', :action=>'single'
	map.tags 'cloud', :controller=>'frontpage', :action=>'tags'
	map.one_tag 'cloud/:tag', :controller=>'frontpage', :action=>'one_tag'
	map.date 'date', :controller=>'frontpage', :action=>'date'
	

	
	# See how all your routes lay out with "rake routes"
	# Install the default routes as the lowest priority.
	map.connect ':controller/:action/:id'
	map.connect ':controller/:action/:id.:format'
end
