Rails.application.routes.draw do
  get 'users/finish_signup'

  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
  match '/users/:id/finish_signup', to: 'users#finish_signup', via: [:get, :patch], as: :finish_signup

  namespace :admin do
    root 'dashboard#index'

    resources :events
  end

  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
