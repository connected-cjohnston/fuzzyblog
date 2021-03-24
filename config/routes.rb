Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :articles, only: %i[index show]

  resources :admin, only: [:index]

  namespace :admin do
    resources :articles, except: :show
  end

  root 'articles#index'
end
