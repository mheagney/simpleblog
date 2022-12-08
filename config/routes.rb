Rails.application.routes.draw do
  resources :posts
  resources :registrations
  resources :sessions

  root "posts#index"
end
