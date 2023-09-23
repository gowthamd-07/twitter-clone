Rails.application.routes.draw do
  get 'health_check', to: 'health_checks#health_check'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :posts do
    resources :comments
  end

  root to: 'posts#index'
end
