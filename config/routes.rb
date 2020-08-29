Rails.application.routes.draw do
  root 'top#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "about" => "top#about"

  resources :members do
    get "search", on: :collection
  end

  resource :session, only: [:create, :destroy]
  resource :account, only: [:show, :edit, :update]
  resource :password, only: [:show, :edit, :update]

end
