Rails.application.routes.draw do
  root to: 'welcome#index'
  get '/auth/:provider/callback' => 'sessions#create'
  get '/logout' => 'sessions#destroy', as: :logout
  post 'posts' => 'posts#create', as: :post_create

  resource :user do
    get 'retire'
  end

  resources :topics do
    resources :posts
  end

  resources :events do
    resources :tickets
  end
end
