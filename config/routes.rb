Rails.application.routes.draw do
  root "top#index"
  get "about" => "top#about", as: "about"

  resources :members, only: [:index, :show] do
    get "search", on: :collection
    resources :entries, only: [:index]
  end

  resource :session, only: [:create, :destroy]
  resource :account, only: [:show, :edit, :update]
  resource :password, only: [:show, :edit, :update]

  resources :articles
  resources :entries do
    patch :like, :unlike, on: :member
    get :voted, on: :collection
    resources :images, controller: "entry_images"
  end

  namespace :admin do
    root to: "top#index"
    resources :members do
      get "search", on: :collection
    end
  end
end
