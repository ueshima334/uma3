Rails.application.routes.draw do
  devise_for :users
root to: "users#index"
resources :users,only:[:show,:new]
resources :rooms,only:[:index]
resources :posts do
  resources :comments,only: :create
  get '/likes',to: 'likes#create'
  delete '/likes',to: 'likes#destroy'
  collection do
    get 'search'
  end
end
resources :surveys,only:[:index,:new,:show,:create,:destroy] do
  resources :votes,only:[:create]
end
end
