Rails.application.routes.draw do
    root 'articles#index'  # Ensure this line is present
    resources :articles, only: [:index, :show]
    resources :analytics, only: [:index]
end
