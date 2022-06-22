# frozen_string_literal: true

Rails.application.routes.draw do
  resources :buku
  resources :peminjaman_bukus
  resources :users
  post '/login', to: 'sessions#create'
end
