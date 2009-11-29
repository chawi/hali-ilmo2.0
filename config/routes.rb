ActionController::Routing::Routes.draw do |map|
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


  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing or commenting them out if you're using named routes and resources.

	map.logout "/sessions/logout", :controller => "sessions", :action => "destroy"
	map.delete_user "/users/delete", :controller => "users", :action => "destroy"
	map.delete_course "/courses/delete", :controller => "courses", :action => "destroy"
	map.delete_course_instance "/course_instances/delete", :controller => "course_instances", :action => "destroy"
	map.builder "builder/index", :controller => "builder", :action => "index"



	map.resources :users
  map.resources :courses
  map.resources :sessions	
	map.resources :course_instances
	map.resources :registrations

	#nested routes
	map.resources :course do |course|
		course.resources :course_instances do |course_instance|
			course_instance.resources :exercise_groups
		end
	end

	#admin namespace-lisäys
	map.namespace(:admin) do |admin|
		admin.resources :users, :active_scaffold => true
		admin.resources :courses, :active_scaffold => true
		admin.resources :course_instances, :active_scaffold => true
		admin.resources :exercise_groups, :active_scaffold => true
		admin.resource :mailer, :controller => "mailer"
	end

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'

  # You can have the root of your site routed with 		map.root -- just remember to delete public/index.html.
  map.root :controller => "sessions"

end
