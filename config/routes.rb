Rails.application.routes.draw do
  post 'books' => 'books#create'   #ここを追記します
  get 'homes/top'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :books, only: [:new, :create, :index, :show, :edit]
  resources :users, only: [:show, :edit, :update]
end
