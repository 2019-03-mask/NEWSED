Rails.application.routes.draw do
  devise_for :users

  resources :items do
    resources :reviews, only:[:create, :destroy]
    resources :favorites, only:[:create, :destroy]

    collection do
      get :index_used
    end
  end

  resources :users do
    collection do
      get :favorites
      get :top
      get :purchase_history
    end
    member do
      post :favorite
      get :delete
      post :delete
  end
end

  resources :contacts, only:[:create, :show, :index]
  get '/contacts_top' => 'contacts#top', as: 'contact_top'
   get 'contacts/:id' => 'contacts#show', as: 'conta'

  resources :carts, only:[:index, :show]
  get '/function/:id' => 'carts#function', as: 'cart_function'
  get '/complete' => 'carts#complete', as: 'cart_complete'
  post '/carts/:id/add_item'  => 'carts#add_item', as: 'cart_add_item'
  patch '/carts/:id' => 'carts#address_change'
  post '/buy/:id' => 'carts#buy', as: 'cart_buy'




  resources :homes, only:[:index]
  get '/' => 'homes#top',as: "top"

  resources :artists, only:[:show, :create, :new, :destroy]
  get 'artists/:id/new_item' => 'artists#new_item', as: 'artist_new_item'
  get 'artists/:id/used_item' => 'artists#used_item', as: 'artist_used_item'

  resources :genre, only:[:index, :create]
  resources :lable, only:[:index, :create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
