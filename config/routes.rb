Rails.application.routes.draw do
  root "chat#index"
  resources :chat, only: [ :index, :create ]
end
