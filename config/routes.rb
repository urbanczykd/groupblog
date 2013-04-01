Groupblog::Application.routes.draw do


  mount RedactorRails::Engine => '/redactor_rails'

  devise_scope :user do
    get "sign_in",  :to => "devise/sessions#new",       :as => :login
    get "register", :to => "devise/registrations#new",  :as => :register
    get "logout",   :to => "devise/sessions#destroy",   :as => :logout
  end
  devise_for :users


  resources :users, :only => [:show] do
    resources :invitations
    resources :blogs do
      resources :posts
    end
  end

  constraints(Subdomain) do
    match '/comment/:post_id' => 'home#create_comment', :as => "create_comment", :via => "post"
    match '/' => 'home#show' do
      resources :posts, :only => [:show]
    end
  end

  match "/admin" => redirect('/admin/users')
  namespace :admin do
    resources :users
    resources :roles
    resources :posts
    resources :blogs
  end

  # devise_scope :user do
  #   get "sign_in", :to => "devise/sessions#new"
  # end


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
   root :to => 'home#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
   match ':controller(/:action(/:id))(.:format)'
end
