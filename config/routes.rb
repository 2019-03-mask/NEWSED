Rails.application.routes.draw do

root 'users#top'
  get 'users/edit'
  get 'users/purchase_history'
  get 'users/favorite'
  get 'users/delete'
  get 'users/index'
  get 'users/show'
  get 'items/index'
  get 'items/show'
  get 'items/new'
  get 'items/edit'
  get 'homes/top'
  get 'homes/index'
  get 'contacts/top'
  get 'contacts/show'
  get 'contacts/index'
  get 'carts/index'
  get 'carts/function'
  get 'carts/show'
  get 'carts/complete'
  get 'artists/index'


  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
