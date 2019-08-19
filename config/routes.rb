Rails.application.routes.draw do
  resources :rates do
    resources :lessons
    resources :courses
  end
  devise_for :users
  root 'welcome#index'
  resources :users do
    member do
      get :confirm_email
    end
  end
end
