# frozen_string_literal: true

Rails.application.routes.draw do
  resources :buku, only: %i[index show update create destroy]
  get '/search', to: 'search#search_title'
  resources :categories
  resources :peminjaman_bukus
  resources :users
  post '/login', to: 'sessions#create'
end
