Rails.application.routes.draw do

# ユーザー用
# URL /users/sign_in ...
devise_for :users, controllers: {
  registrations: "user/registrations",
  sessions: 'user/sessions'
}

# 管理者用
# URL /admin/sign_in ...
devise_for :admin, controllers: {
  sessions: "admin/sessions"
}


# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
 namespace :admin do 
 get "/" => "homes#top"
  resources :users, only: [:new, :index, :show, :create, :edit,:update] do
   get "check"
    #ユーザーの会員状況を取得
    patch "withdrawl"
    #ユーザーの会員状況を更新
end
  resources :movies, only: [:new, :index, :show, :create, :edit, :update]
  resources :genres, only: [:new, :show, :edit,:index,:update,:create]
 end
 
 scope module: :user do
   get "/" => "homes#top",as: "root"
   get 'search' => 'movies#search'
   get "/success" => "homes#success"
   get "/favoritetest" => "homes#favoritetest"

   resources :movies, only: [:index, :show ]
   resources :comments
   resources :favorite, only: [:index, :edit, :update, :destroy ]
   post '/favorite/:movie_id' => "favorite#create"
   get "/old" => "movies#old"
   
    

 end
 










end
