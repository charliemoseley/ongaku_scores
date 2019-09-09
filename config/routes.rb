Rails.application.routes.draw do
  get 'login', to: redirect('/auth/discord'), as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')

  root 'pages#home'
end
