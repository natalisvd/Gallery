GalleryApp::Application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :categories, only: [:show, :index]
  get 'categories/:name/:id' => 'pictures#show', :as => :show_picture
  resources :pictures, only: [:index] do
    resources :comments
  end
  get 'events/:user_id/:eventable_type' => 'events#show', :as => :event
  resources :events, only: [:index]

  get 'comments' => 'comments#index', :as => :comments
  resources :likes, only: [:new, :destroy]

   root 'pictures#index'


end
