GroupProject::Application.routes.draw do

  root 'pages#index'
  get '/album' => 'pages#album'
  get '/artist' => 'pages#artist'
  get '/fan' => 'pages#fan'
  get '/playlist' => 'pages#playlist'

  get "/tests/audio_upload"
  get "/tests/test_facebook"
  get "/tests/list_songs"

  resources :playlists
  resources :fans
  resources :songs
  resources :albums
  resources :artists
  resources :artist_sessions, only: [:new, :create, :destroy]

  #used for facebook auth
  match 'auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  match 'auth/failure', to: redirect('/'), via: [:get, :post]
  match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get, :post]

  #Artist Authentication
  #match 'artists/new', to: 'artists#new', via: 'get'
  match 'artist_sign_up', to: 'artists#new', via: 'get'
  # match 'artists', to: 'artists#create', via: 'post'

  #Artist Sign In Session
  match '/artist_signin',  to: 'artist_sessions#new',         via: 'get'
  match '/artist_signout', to: 'artist_sessions#destroy',     via: 'delete'

  match '/playlists/add_song', to: 'playlists#add_song',      via: 'post'


  #match '/songs', to: 'songs#upload', via: 'post'
  
  match '/album_edit', to: 'albums#new', via: 'get'

  match '/download/:id', to: 'songs#download', via: 'post'

  
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
