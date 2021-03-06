ActionController::Routing::Routes.draw do |map|

  map.resources :geo_locations
  map.resources :sponsors 
  
  map.resources :users do |user|
    user.resources :expeditions, 
    :member => {:add_team => :post,
    :remove_team => :post}          
    user.resources :stories 
    user.resources :teams
    user.resources :expeditions
  end
  map.resource  :session
  
  # The priority is based upon order of creation: first created -> highest priority.
  
  # Sample of regular route:
  # map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  # map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # You can have the root of your site routed by hooking up '' 
  # -- just remember to delete public/index.html.
  # map.connect '', :controller => "welcome"

  
  # named routes
  map.home '/', :controller         => "home", :action => "index"
  map.facebook 'facebook', :controller => 'facebook', :action => 'index', :canvas => true
  # map.connect '', :controller => 'facebook', :action => 'index', :canvas => true
  
  # map.signup '/signup', :controller => "users", :action => "new"
  # map.login '/login', :controller   => "sessions", :action => "new"
  map.logout '/logout', :controller => "sessions", :action => "destroy"
  map.activate '/activate/:id', :controller           => "users", :action => "activate"
  map.forgot_password '/forgot_password', :controller => "users", :action => "forgot_password"
  map.reset_password '/reset_password/:id', :controller   => "users", :action => "reset_password" 

  # map.stories '/stories', :controller   => "users", :action => "stories"
  # map.profile '/profile', :controller => "users", :action => "profile"

  # Allow downloading Web Service WSDL as a file with an extension
  # instead of a file named 'wsdl'
  # map.connect ':controller/service.wsdl', :action => 'wsdl'

  # Install the default route as the lowest priority.
  map.connect ':controller/:action/:id.:format'
  map.connect ':controller/:action/:id'

end
