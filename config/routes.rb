Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions' }

  resources :users, except: [:index]
  resources :registered_applications
  root 'welcome#index'
end
