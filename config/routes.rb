Rails.application.routes.draw do
  root "home#home"
  get "/about_us", to: "home#about_us"
  # root "home#under_construction"
  resources :sessions
  resources :users

  resources :skills do
    post 'lesson_sms',to: 'notifications#notify_lesson_request'
    resources :reviews, only: :create
  end
  resources :lessons, only: [:index, :create, :show, :update] do
    resources :reviews, only: :new
  end
  resources :messages, only: [:index, :create, :show, :new]
  resources :profiles, only: :show

  delete 'logout', to: 'sessions#destroy'
end
