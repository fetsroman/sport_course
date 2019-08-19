Rails.application.routes.draw do
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    resources :courses do
      resources :lessons
      resources :rates
    end
    devise_for :users
    root "welcome#index"
    resources :users do
      member do
        get :confirm_email
      end
    end
  end
  match '*path', to: redirect("/#{I18n.default_locale}/%{path}"), via: [:get, :post]
  match '/', to: redirect("/#{I18n.default_locale}"), via: [:get, :post]
end
