Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "home#home"
  # root "home#under_construction"

  resources :skills do
    post 'lesson_sms',to: 'notifications#notify_lesson_request'
    resources :reviews, only: :create
  end
  resources :lessons, only: [:index, :create, :show, :update] do
    resources :reviews, only: :new
  end
  resources :messages, only: [:index, :create, :show, :new]
  resources :profiles, only: :show
resources :sessions
end
