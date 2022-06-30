# frozen_string_literal: true

Rails.application.routes.draw do
  # for login
  post '/login', to: 'sessions#create'

  # for search book
  get '/search', to: 'search#search_title'

  # for CRUD category
  resources :categories, only: %i[ create update destroy index show ]

  # for CRUD users
  resources :users, only: %i[ create update destroy index show ]

  # for CRUD buku
  resources :buku, only: %i[create update destroy index show]

  # for CRUD announcement category
  resources :announcement_categories

  # for CRUD announcement
  resources :announcements, only: %i[create update destroy index show]

  # for get all reveiew from spesific book
  get '/buku/:buku_id/reviews', to: 'book_reviews#index'

  # create book loan transaction
  post '/buku/:buku_id/peminjaman_buku', to: 'peminjaman_bukus#create'

  # delete loan transaction
  delete '/user/:user_id/peminjaman_buku/:id', to: 'peminjaman_bukus#destroy'
end
