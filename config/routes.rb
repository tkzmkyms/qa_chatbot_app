Rails.application.routes.draw do
  root "chat#index"
  post "/chat", to: "chat#create"
end
