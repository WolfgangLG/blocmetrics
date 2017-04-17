Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions', :registrations => "users/registrations", :passwords => "users/passwords" }

  resources :users, except: [:index]
  resources :registered_applications
  root 'welcome#index'
end
