Rails.application.routes.draw do
  root 'stresses#index'

  get 'sessions/new'   => 'sessions#new'
  post 'sessions'      => 'sessions#create'
  delete 'sessions'    => 'sessions#destroy'

  get 'users'          => 'users#index'
  post 'users'         => 'users#create'


  get 'stresses'       => 'stresses#index'
  post 'stresses'      => 'stresses#create'

  get 'solutions'      => 'solutions#index'
  get 'chats'          => 'chats#index'
  post 'chats'          => 'chats#create'

  get 'emergency'      => 'stresses#emergency' 
  
  ## games
  get 'games/index' => 'games#index'
  get 'games'       => 'games#index'
  ## images
  resources :images
  
  ## media
  get 'media' => 'media#index'
  get 'media/cats' => 'media#cat'
  get 'media/dogs' => 'media#dog'

  get 'media/med' => 'media#med'
  get 'media/bossa' => 'media#bossa'
  get 'media/cafe' => 'media#cafe'

  get '/articles' => 'articles#index'
  get '/articles/get_results(/:query)' => 'articles#get_results'


  get '/places' => 'places#index'
  post '/places/geturl' => 'places#geturl'
  get 'schedulers' => 'schedulers#new'
  get 'schedulers/new' => 'schedulers#new'
  post 'schedulers' => 'schedulers#create'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
