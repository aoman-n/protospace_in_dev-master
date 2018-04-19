Rails.application.routes.draw do
  devise_for :users
  root 'prototypes#index'

  resources :prototypes, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
    resources :comments, only: [:index, :create] do
      collection do
      post :like
    end
  end

  end

  resources :users, only: [:show, :edit, :update]
end
