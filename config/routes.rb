Rails.application.routes.draw do
  devise_for :users

  resources :items do
    collection do
      get :index_used
    end
    resources :reviews, only:[:create, :destroy]
    resources :favorites, only:[:create, :destroy]
  end

  resources :users do
    collection do
      get :top
      get :purchase_history
    end
    member do
      get :favorite
      post :favorite
      get :delete
      post :delete
  end
end

  resources :contacts, only:[:create, :show, :index]
  get '/contacts_top' => 'contacts#top', as: 'contact_top'

  resources :carts, only:[:index, :show]
  get 'carts/function' => 'carts#function'


  resources :homes, only:[:index]
  get '/' => 'homes#top',as: "top"

  resources :artists, only:[:index, :create, :new, :destroy]
  get 'artists/new_item' => 'artists#new_item'
  get 'artists/used_item' => 'artists#used_item'

  resources :genre, only:[:index, :create]
  resources :lable, only:[:index, :create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
