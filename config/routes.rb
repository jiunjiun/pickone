Rails.application.routes.draw do
  get 'events/show'

  get 'users/finish_signup'

  devise_for :users, controllers: { sessions: 'users/sessions', omniauth_callbacks: "users/omniauth_callbacks" }
  match '/users/:id/finish_signup', to: 'users#finish_signup', via: [:get, :patch], as: :finish_signup

  namespace :admin do
    root 'dashboard#index'

    resources :events
  end

  root 'home#index'

  get  'events/:code',        to: 'events#show',   as: :event
  post 'events/:code/voted',  to: 'events#voted',  as: :voted_event

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
