Rails.application.routes.draw do
  resources :categories
  resources :buku
  resources :peminjaman_bukus
  resources :users
  post '/login', to: "sessions#create"
end
