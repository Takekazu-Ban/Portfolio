Rails.application.routes.draw do
  get 'join/create'
  get 'join/destroy'
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
  resources :circles, only: [:new, :edit, :show, :create, :update, :destroy] do
    resources :joins, only: [:create, :destroy] do
      #patch :delete
    end
    get :index
    get :host_room
    get :join_room
  end
  resources :inquiries, only: [:index, :show, :create]
  resources :host_circles, only: [:show, :create] do
    get :joining_show
  end
  #resources :messages, only: [:crete]
end

  namespace :admins do
  resources :circles, only: [:index, :show, :destroy]
  resources :inquiries, only: [:show, :create]
  resources :users, only: [:index, :show, :destroy] do
  #patch :delete
  end
end

  root 'users/homes#top'
end
