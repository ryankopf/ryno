Rhino::Engine.routes.draw do
  resources :blocks
  resources :pages do
    member do
      get :publish
    end
  end
  resources :publishedpages
  root to: 'pages#index'
end
