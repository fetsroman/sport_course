Rails.application.routes.draw do
  get'lang/:locale', to: 'application#change_locale', as: :change_locale

  scope "/:locale", locale: /#{I18n.available_locales.join("|")}/ do
    resources :courses do
      resources :lessons do
        get '/watched', to: 'watched_lists#watched'
      end
      resources :rates do
        match '/bought_course', to: 'payment#bought_course', via: [:get, :post]
      end
    end
    devise_for :users, controllers: {
        sessions: 'users/sessions',
        registrations: 'users/registrations'
    }
    root "welcome#index"
    namespace :users do
      get :confirm_email
    end
    get '/my_courses', to: 'bought_list#index'

    get '/admin', to: "admin#index"
    devise_for :admins, path: "admin", only: [:sessions], controllers: { sessions: "admin/sessions"}
    namespace :admin do
      resources :courses do
        put 'publish', to: 'courses#publish', on: :member, as: :publish
        put 'unpublish', to: 'courses#unpublish', on: :member, as: :unpublish
        resources :lessons
        resources :rates
      end
      resources :welcome, only: [:index, :edit, :update]
      get 'statistics', to: 'statistics#index'
    end
  end

  get '/', to: redirect("/#{I18n.default_locale}")
  get "/*path", to: redirect("/#{I18n.default_locale}/%{path}"), constraints: { path: %r{(?!(#{I18n.available_locales.join('|')})\/).*} }
end
