Rails.application.routes.draw do

  resources :items do
    collection do
      get :index_used
    end
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
  get 'contacts/top' => 'contacts#top'

  resources :carts, only:[:index, :show]
  get 'carts/function' => 'carts#function'


  resources :homes, only:[:index]
  get '/' => 'homes#top'

  resources :artists, only:[:index, :create, :new, :destroy]
  devise_for :users
  resources :genre, only:[:index, :create]
  resources :lable, only:[:index, :create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
