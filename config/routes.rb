Rails.application.routes.draw do
  resources :events
  devise_for :users
  resources :users, only: [:edit , :show, :update, :index]
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
