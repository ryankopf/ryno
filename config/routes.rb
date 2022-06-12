Rhino::Engine.routes.draw do
  resources :blocks
  resources :pages
  resources :publishedpages
  root to: 'pages#index'
end
