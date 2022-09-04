Rails.application.routes.draw do
  get 'pages/home'
  devise_for :users, controllers: { omniauth_callbacks: "callbacks" }
  get 'profile', to: 'users#profile'
  root 'pages#home'
end
