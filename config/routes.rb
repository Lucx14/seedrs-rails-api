Rails.application.routes.draw do
  resources :campaigns do
    resources :investments
  end

  post 'auth/login', to: 'authentication#authenticate'
  post 'signup', to: 'users#create'
end

