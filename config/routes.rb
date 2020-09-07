Rails.application.routes.draw do
  root 'post_images#index'
  #ルートパス
  #ログイン認証成功後、投稿一覧に直接アクセスするように設定
  
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  resources :post_images, only: [:new, :create, :index, :show]
  #onlyは、生成するルーティングを限定するオプション
  #新規投稿　new,create
  #一覧　index
  #詳細　show
end