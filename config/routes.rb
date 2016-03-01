Rails.application.routes.draw do
  devise_for :users

  root 'devise/registrations#new'
end
