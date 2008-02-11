ActionController::Routing::Routes.draw do |map|
	map.resources :tags
	
	map.resources :posts
	
	map.frontpage '', :controller=>'frontpage', :action=>'index', :page=>1
	map.archive 'page/:page', :controller=>'frontpage', :action=>'index'
	map.single 'post/:slug', :controller=>'frontpage', :action=>'single'
	
	# See how all your routes lay out with "rake routes"
	# Install the default routes as the lowest priority.
	map.connect ':controller/:action/:id'
	map.connect ':controller/:action/:id.:format'
end
