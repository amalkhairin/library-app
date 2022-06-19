Rails.application.routes.draw do
  resources :peminjaman_bukus
  resources :users
  post '/login', to: "sessions#create"
end
