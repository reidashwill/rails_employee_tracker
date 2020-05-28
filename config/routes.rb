Rails.application.routes.draw do
  root to: 'divisions#index'
  resources :divisions do
    resources :employees do
    end
  end
  resources :employees do
    resources :projects do
    end
  end
end
