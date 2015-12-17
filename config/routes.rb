Rails.application.routes.draw do
  devise_for :users
  resources :stories do
    post :translate, on: :member
  resources :ratings
  end
  resources :users do
    resources :stories, controller: 'users/stories'
  end
  resources :categories do
    resources :stories, controller: 'categories/stories'
  end
  root 'stories#index'
end
