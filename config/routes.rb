VegetableMarket::Application.routes.draw do
  
  post "votes/check" => "votes#check"
  get "votes/login" 
  
  get 'votes' => 'votes#index'
  get 'votes/vote'
  
  resources :tickets

  resources :order_statuses

  resources :order_items

  get 'orders/payment' => 'orders#payment'
  resources :orders

  resources :customers

  devise_for :users
  resources :users

  resources :roles
  
  get 'carts/list'
  post 'carts/create/:id' => 'carts#create'
  
  get 'welcome/index'
  get 'merchandises', :to => 'merchandises#index', :as => :user_root
  get 'welcome/master_menu' => 'welcome#master_menu'
  get 'welcome/staff_entry', :to => 'welcome#staff_entry', :as => :staff_entry
  
  get 'merchandises/photo' => 'merchandises#photo'
  resources :merchandises

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
