Rails.application.routes.draw do
  root :to => 'public/posts#index'

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

  namespace :admins do
    get 'top', to: 'homes#top'
    resources :users,     :only => [:index, :show, :edit, :update]
    resources :posts,     :only => [:show, :destroy]
    resources :comments,  :only => [:destroy]
    resources :favorites, :only => [:show]
    resources :genres
    resources :makers
  end

  scope module: :public do
    get '/homes/about', to: 'public/homes#about'
    resources :homes,    :only => [:about]
    resources :users,    :only => [:my_pages, :show, :edit, :update, :unsubscribe, :withdraw]
    resources :posts,    :only => [:index, :show, :create, :destroy]
    resources :comments, :only => [:create, :destroy]
    resources :favorites, :only => [:show, :create, :destroy]

  end



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


end
