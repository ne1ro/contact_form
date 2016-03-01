Rails.application.routes.draw do
  devise_for :users

  resources :contacts, only: %i(new create)

  root 'contacts#new'
end
