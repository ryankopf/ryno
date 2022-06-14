Rhino::Engine.routes.draw do
  resources :blocks do
    member do
      get :makecolumns
    end
  end
  resources :pages do
    member do
      get :publish
    end
  end
  resources :publishedpages
  root to: 'pages#index'
end
