ActionController::Routing::Routes.draw do |map|
  map.logout '/logout', :controller => 'sessions', :action => 'destroy'
  map.login '/login', :controller => 'sessions', :action => 'new'
  map.register '/register', :controller => 'users', :action => 'create'
  map.signup '/signup', :controller => 'users', :action => 'new'
  
  map.user_page '/user/:login', :controller => 'users', :action => 'show'
  
  map.user_stories '/user/:id/stories', :controller => 'stories', :action => 'index'
  map.stories_rss '/stories/:permalink/rss/', :controller => 'stories', :action => 'rss'
  
  map.add_fic '/story/:permalink/add', :controller => 'stories', :action => 'create_fic'
  map.leave_story '/story/:permalink/leave', :controller => 'stories', :action => 'leave'   
  
  map.connect '/invite/add', :controller => 'invitations', :action => 'create'
  map.process_invitation '/invite/:token', :controller => 'invitations', :action => 'process_invite'
  
  map.new_story '/story/add', :controller => 'stories', :action => 'new'
  
  map.connect '/stories/:permalink', :controller => 'stories', :action => 'show'
  
  map.resources :stories  do |story|
    story.resources :fics
  end
  
  map.resource :session
  map.resources :users
  map.resources :fics
  
  map.root :controller => 'stories'

  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller
  
  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  # map.root :controller => "welcome"

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing or commenting them out if you're using named routes and resources.
  #map.connect ':controller/:action/:id'
  #map.connect ':controller/:action/:id.:format'
  
end
