GalleryApp::Application.routes.draw do
  devise_for :users
  resources :categories, :key => :name
  get 'categories/:name/:id' => 'pictures#show', :as => :show_picture
  resources :pictures do
    resources :comments
  end
  resources :events, only: [:index] do
    collection do
      get '/navigation/:user_id' => 'events#navigation', as: 'navigation'
      get '/sign_in/:user_id' => 'events#sign_in', as: 'sign_in'
      get '/sign_out/:user_id' => 'events#sign_out', as: 'sign_out'
      get '/like/:user_id' => 'events#like', as: 'like'
      get '/comment/:user_id' => 'events#comment', as: 'comment'
    end
  end
  resources :likes, only: [:new, :destroy]

   root 'pictures#index'


end
