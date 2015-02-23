Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
   root :to => redirect('/login')

   get '/users' => redirect('/users/new')
   get  '/login'   => 'sessions#new'

   post '/login'   => 'sessions#create'

   get '/logout' => 'sessions#destroy'

  get '/apikeys/destroy/:id' => 'apikeys#destroy', :as  => 'apikeys_destroy'
  get '/apikeys/generate/:id' => 'apikeys#generate', :as => 'apikeys_generate'

   resources :users, only: [:new, :create, :show]

  namespace :api, defaults: {format: :json}do
    namespace :v1 do
      get '/authenticate' => 'auths#authenticate'
      resources :coffeehouses, only: [:index, :show] do
        resources :tags, only: [:index, :create, :update, :destroy]
      end
      resources :tags, only: [:index]
      get 'tags/:id/coffeehouses' => 'tags#coffeehouses'
      resources :creators, only: [:index, :create, :update, :destroy] do
        resources :coffeehouses, only: [:index, :create, :update, :destroy]
      end
    end
  end

end
