Rails.application.routes.draw do
  root :to => 'public/posts#index'

  namespace :admins do
    resources :homes,     :only => :top
    resources :users,     :only => [:index, :show, :edit, :update]
    resources :posts,     :only => [:show, :destroy]
    resources :comments,  :only => [:destroy]
    resources :favorites, :only => [:show]
  end

  scope module: :public do
    resources :homes,    :only => :about
    resources :users,    :only => [:my_pages, :show, :edit, :update, :unsubscribe, :withdraw]
    resources :posts,    :only => [:index, :show, :create, :destroy]
    resources :comments, :only => [:create, :destroy]
    resources :favorites, :only => [:show, :create, :destroy]

  end

  devise_for :admins, :controllers => {
    sessions: 'admins/sessions',
    passwords: 'admins/passwords',
    registrations: 'admins/registrations'
  }

  devise_for :users, :controllers => {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


end
