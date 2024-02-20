Rails.application.routes.draw do
  get 'docs/show'
  namespace :admin do
    resources :projects
    resources :users

    root to: "projects#index"
  end

  root "home#index"

  devise_for :users

  resources :projects do
    resources :posts do
      resources :comments
    end
    resources :documents, only: [:create, :index, :show, :destroy]
  end

  devise_scope :user do
    get '/users/sign_out', to: 'devise/sessions#destroy'
  end

  get "/notadmin", to: "home#notadmin"
end
