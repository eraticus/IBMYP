ActionController::Routing::Routes.draw do |map|

  map.resources :coverages

  map.resources :strategies

  map.resources :approaches

  map.resources :skills do |skill|
    skill.resources :strategies # need only "create"
  end

  map.resources :learning_styles

  map.resources :learning_styles

  map.resources :intelligences

  map.resources :learner_profiles

  map.resources :courses

  map.resources :learner_profiles

  map.resources :learning_styles

  
  map.resources :criterions do |criterion|
    criterion.resources :objectives # mostly for creation of new criterions
  end

  map.resources :indicators # change name to indicators

  map.resources :standards, :has_many=>:indicators

# all the admin paths
  map.resources :subjects, :has_many=>[:courses, :criterions, :standards] do |subject|
    #subject.resource :criterions
 #   subject.resource :standards
  end



  map.resources :objectives

  map.login "login", :controller=>'user_sessions', :action=>'new'
    map.logout "logout", :controller=>'user_sessions', :action=>'destroy'
  
  map.resources :user_sessions

  map.resources :users

  # eventually delete. summative tasks and formative tasks do not exist outside the context
  # of a unit_planner
  map.resources :summative_tasks
  map.resources :formative_tasks

  # all the teacher routes
  # change edit_objectives to restful under objectives
  map.resources :unit_planners, :member=>{:edit_learning_activities=>:get, :edit_resources=>:get, :edit_summative_exemplars=>:get, :edit_teaching_strategies=>:get, :edit_international_awareness=>:get, :edit_know_understand_perform=>:get, :edit_diagnostic_assessment=>:get,:edit_prior_knowledge=>:get, :update_indications=>:put, :update_learning_styles=>:put, :update_learner_profiles=>:put, :edit_identification=>:get, :edit_visioning=>:get, :edit_objectives=>:get, :update_objectives=>:put, :edit_tasks=>:get, :update_tasks=>:put} do |unit_planner|
    unit_planner.resources :summative_tasks
    unit_planner.resources :formative_tasks
    unit_planner.resources :learning_styles
    unit_planner.resources :standards
    unit_planner.resources :indications
    unit_planner.resources :learner_profiles
    unit_planner.resources :approaches
  end
  
  map.root :unit_planners  

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
  # consider removing the them or commenting them out if you're using named routes and resources.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
