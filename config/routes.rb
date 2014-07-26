BitBuddy::Application.routes.draw do

  resources :contacts do
    resources :payments, only: [:new, :create]
  end

  resources :requests
  resources :blockchain, only: :index

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  devise_scope :user do
    get 'sign_in', :to => 'users#signin', :as => :new_user_session
    get 'sign_in', :to => 'users#signin', :as => :new_session
    get 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_session
  end

  root 'coinbase#info'

end
