# frozen_string_literal: true

Rails.application.routes.draw do
  resources :buku, only: %i[index show update create destroy]
  get '/search', to: 'search#search_title'
  resources :categories
  resources :peminjaman_bukus
  resources :users
<<<<<<< HEAD
  resources :review_bukus
  post '/login', to: "sessions#create"
=======
  post '/login', to: 'sessions#create'
>>>>>>> f17dad0172a8a1d795475a04a9278e9a3e7e0f92
end
