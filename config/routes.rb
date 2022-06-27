# frozen_string_literal: true

Rails.application.routes.draw do
  get '/search', to: 'search#search_title'
  resources :categories
  resources :users
  post '/login', to: 'sessions#create'

  # create book loan
  resources :buku do 
    resources :peminjaman_bukus
    post '/login', to: 'sessions#create'
  end
end
