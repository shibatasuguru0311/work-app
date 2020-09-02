Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'works#index'
resources :users, only: [:show,:edit,:update]
resources :messages, only: [:create]
resources :rooms, only: [:create,:show]
resources :works

put 'users/follow/:user_id' => 'users#follow'
put 'users/unfollow/:user_id' => 'users#unfollow'
#フォローとフォローを外すアクション

get 'users/follow_list/:user_id' => 'users#follow_list'
get 'users/follower_list/:user_id' => 'users#follower_list'
#フォロー・フォロワーの一覧ページ




end
