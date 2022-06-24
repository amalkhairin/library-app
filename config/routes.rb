Rails.application.routes.draw do
  resources :categories
  resources :buku
  resources :peminjaman_bukus
  resources :users
  resources :review_bukus
  post '/login', to: "sessions#create"
end
