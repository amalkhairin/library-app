# frozen_string_literal: true

Rails.application.routes.draw do
  get '/search', to: 'search#search_title'
  resources :categories
  resources :users
  post '/login', to: 'sessions#create'
  resources :buku, only: %i[ create update destroy index]
  # create book loan transaction
  post '/buku/:buku_id/peminjaman_buku', to: 'peminjaman_bukus#create'

  # delete loan transaction
  delete '/user/:user_id/peminjaman_buku/:id', to: 'peminjaman_bukus#destroy'
end