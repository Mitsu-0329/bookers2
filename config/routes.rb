Rails.application.routes.draw do
  devise_for :users
  root to: "homes#top"
  post 'books' => 'books#create'   #ここを追記します
  get 'homes/top'
  get 'homes/about'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :books, only: [:new, :create, :index, :show, :edit]
  resources :users, only: [:show, :edit, :update]


  get '/homes/about' => 'homes#about', as: 'about'

end
