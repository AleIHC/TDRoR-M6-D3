Rails.application.routes.draw do
  resources :cc_comments
  resources :cc_posts

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  post '/new_cc_user_cc_like', to: 'cc_likes#new_cc_user_cc_like', as: 'new_cc_user_cc_like'

  # Rutas para devise
  devise_for :cc_users, controllers: {
    sessions: "cc_users/sessions",
    registrations: "cc_users/registrations"
  }

  # Defines the root path route ("/")
  root "cc_posts#index"
end
