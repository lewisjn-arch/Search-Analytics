Rails.application.routes.draw do
  root 'articles#index'
  resources :articles, only: [:index, :show, :new, :create]
  resources :analytics, only: [:index]
end
