Rails.application.routes.draw do


  namespace :admin do
  end
  # mount Fae below your admin namespec
  mount Fae::Engine => '/admin'



  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :users, only: [:edit , :show, :update, :index] do
    resources :dashboards, only: [:index]
    get "created_events", to: "dashboards#created_events", as: "created_events"
    get "participated_events", to: "dashboards#participated_events", as: "participated_events"
  end
  resources :events do
    resources :live, only: [:index]
    post "remove_user_from_event/:id", to: "events#remove_user_from_event", as: "remove_user_from_event"
    get "questions", to: "questions#new", as: "new_question"
    post "questions", to: "questions#create"
  end
  post "register", to: "events#register_users"
  root to: 'pages#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
