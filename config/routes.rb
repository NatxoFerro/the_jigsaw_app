Thejigsawapp::Application.routes.draw do
  
  #get "students/index"

  #get "students/new"

  #get "students/edit"

  #get "students/show"

  #get "students/delete"

  get "topics/index"

  get "topics/new"

  get "topics/edit"

  get "topics/show"

  get "topics/delete"

  get "login/login"

  get "users/search"

  get "users/jigsaw"

  resources :logins
  
  resources :users do
    resources :games 
  end
  
  resources :games do
    resources :topics, :groups, :students
  end
  
  resources :jigsaws
  
  resources :groups do
    resources :students
  end
  
  resources :students 
  
  resources :documents
  
  get 'login', to: 'logins#new'
  
  root to: "logins#new" 
  
  get '/games/:id/del_docs', to: 'games#del_docs', as: 'game_del_docs'
  
  get '/student/:student_id/games/:id/play_game', to: 'games#play_game', as: 'student_game_play'
  
  get '/user/admin', to: 'users#admin', as: 'user_admin'
  
  #match '/users/search', to: 'users#search', via: 'post'
  
  #match '/games/:id/edit_doc(.:format)', to: 'games#edit_doc'
  
  # match '/signin',  to: 'sessions#new',         via: 'get'
  # match '/signout', to: 'sessions#destroy',     via: 'delete'
  
  # root to: 'users#login'
  
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'

end
