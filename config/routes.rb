MiniLms::Application.routes.draw do

  resources :pages

  devise_for :instructors, :controllers => { :sessions => "instructors/sessions", :registrations => "instructors/registrations"  }
  	as :instructor do
  	  match "/instructors/registrations/create_photo/:id" => "instructors/registrations#create_photo", :as => :create_photo
  	end
  	
  devise_for :users, :controllers => { :sessions => "users/sessions", :registrations => "users/registrations" }
    as :user do
  	  match "/users/registrations/create_photo/:id" => "users/registrations#create_photo", :as => :create_photo
      
    end
  
  resources :questions, :agendas, :resources
  resources :announcements, :only => [:show, :index]
  resources :instructors, :only => [:show, :index]
  resources :users, :only => [:show, :index]
  

  namespace :admin do
	resources :resources, :questions, :agendas, :announcements, :students
  end

  resources :pages, :except => :show
  
  get "/about" => "pages#about", :as => :about_page

  match "/admin" => "admin/announcements#index", :as => "admin_root"

  root :to => 'announcements#index'
  
  get ':id', to: 'pages#show', :as => :page

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
