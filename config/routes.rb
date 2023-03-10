Rails.application.routes.draw do

  get 'rooms/show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root :to =>"homes#top"
  get "home/about"=>"homes#about"

  devise_for :users

  get "search"=>"searches#search"

  resources :books, only: [:index,:show,:edit,:create,:destroy,:update] do
    resources :book_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
  resources :users, only: [:index,:show,:edit,:update] do
    resource :relationships, only: [:create, :destroy]
    get "relationship/index_follow"=>"relationships#index_follow"
    get "relationship/index_follower"=>"relationships#index_follower"
    get "search"=>"users#search"
  end

  resources :messages, only: [:create]
  resources :rooms, only: [:create, :index, :show]

  resources :groups, only: [:create, :index, :show, :new]


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end