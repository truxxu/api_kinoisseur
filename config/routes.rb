Rails.application.routes.draw do
  resources :genres do
    resources :movies
  end
end
