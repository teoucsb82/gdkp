Rails.application.routes.draw do
  get 'pages/home'
  devise_for :users, controllers: { omniauth_callbacks: "callbacks" }
  root 'pages#home'
end
