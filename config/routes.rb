Rails.application.routes.draw do

  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :users, only: [:edit , :show, :update, :index]

  resources :events do
    post "remove_user_from_event/:id", to: "events#remove_user_from_event", as: "remove_user_from_event"
    get "questions", to: "questions#new", as: "new_question"
    post "questions", to: "questions#create"
  end



  post "register", to: "events#register_users"


  root to: 'pages#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
