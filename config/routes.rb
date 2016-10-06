Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  scope :v1 do
    mount_devise_token_auth_for 'User', at: 'auth', default: {format: "json"}
    match '/auth/register' => "registration#create", via: 'post', defaults: {format: 'json'}
  end

  namespace :api do
    get 'auth/:provider/callback', to: "sessions#create"
    post 'auth/:provider/callback', to: "sessions#create"

    get '/artists', to: 'artists#index'
    get '/artists/search', to: 'artists#search'
    get '/artists/:id', to:'artists#show', as: 'artist'

    get '/parties/players_data' => 'parties#players_data'
    put '/parties/remove_player' => 'parties#remove_player'

    post '/song_matches' => 'song_matches#create'
    get '/song_matches' => 'song_matches#matches_data'
    delete '/song_matches/:id' => 'song_matches#destroy'

    resources :parties, only: [:show, :create, :destroy, :update, :edit] do
      resources :messages, only: [:create, :index]
    end
    resources :songs, only: [:create, :index]
    resources :playlists, only: [:index]
    resources :playlist_songs, only: [:destroy]

    # scope ':username' do
    #   # patch '/playlist/:id', to: 'playlist_songs#update'
    #   delete '/playlist/:id', to: 'playlist_songs#destroy'
    #   post '/playlist/songs', to: 'playlist_songs#create'
    # end
    # get 'auth/:provider/callback', to: 'sessions#create'
    # get 'auth/failure', to: redirect('/')
    # get 'signout', to: 'sessions#destroy', as: 'signout'

    # resources :sessions, only: [:create, :destroy]
    resource :home, only: [:show]

  end



end
