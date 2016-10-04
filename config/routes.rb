Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'auth/:provider/callback', to: "sessions#create"
  post 'auth/:provider/callback', to: "sessions#create"

  namespace :api do

    resources :party, only: [:show, :create, :destroy, :update, :edit] do
      resources :messages, only: [:create, :index]
    end
    resources :songs, only: [:create, :index]
    resources :playlists, only: [:show]
    scope ':username' do
      # patch '/playlist/:id', to: 'playlist_songs#update'
      # delete '/playlist/:id', to: 'playlist_songs#destroy'
      post '/playlist/songs', to: 'playlist_songs#create'
    end

end


  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

  resources :sessions, only: [:create, :destroy]
  resource :home, only: [:show]

end
