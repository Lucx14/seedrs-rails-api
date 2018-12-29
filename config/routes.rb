Rails.application.routes.draw do
  resources :campaigns do
    resources :investments
  end
end
