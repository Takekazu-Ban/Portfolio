Rails.application.routes.draw do
  devise_for :admins, controllers: {
  	sessions: 'admins/sessions',
  	passwords: 'admins/passwords',
  	registrations: 'admins/registrations'
  }

  devise_for :users, controllers: {
  	sessions: 'users/sessions',
  	passwords: 'users/passwords',
  	registrations: 'users/registrations'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'admins' => 'admins#top', as: 'top_admin'

resources :users, only: [:edit, :show, :update] do
  get :home
  patch :delete
  get :leave
end

resources :admins, only: [] do
  get :home
end

  namespace :users do
  resources :circles, only: [:new, :index, :edit, :show, :create, :update, :destroy] do
    get :index
    get :search
  end
  resources :host_circles, only: [:show, :update]
  resources :join_circles, only: [:show]
  resources :messages, only: [:crete]
end

  namespace :admins do
  resources :circles, only: [:index, :show, :destroy]
  resources :users, only: [:index, :show, :destroy] do
  patch :delete
  end
end

  root 'users/homes#top'
end
