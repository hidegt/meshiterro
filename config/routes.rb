Rails.application.routes.draw do
  root 'post_images#index'
  #ルートパス
  #ログイン認証成功後、投稿一覧に直接アクセスするように設定
  
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  #onlyは、生成するルーティングを限定するオプション
  #新規投稿　new,create
  #一覧　index
  #詳細　show
  #投稿削除　destroy
  resources :post_images, only: [:new, :create, :index, :show, :destroy] do
  #画像投稿機能のルート
    resource :favorites, only: [:create, :destroy]
    #いいね機能のルート
    resources :post_comments, only: [:create, :destroy]
    #投稿コメントのルート
    end
    
    #いいね機能ルートが単数のresourceになっている。
    #単数にすると、そのコントローラのidがリクエストに含まれなくなる。
    #今回はいいねの詳細ページは作成しないので、favoritesのshowページが不要。
    #idの受け渡しも必要ないので、resourceとなっています。
    #その後、いいね機能のモデル作成へ
    
    #コメントは、投稿画像に対してコメント。このため、post_commentsは、post_imagesに結びつきます。
    #上記のような親子関係

  resources :users, only: [:show]
  #マイページのルーティング定義
end