class PostImage < ApplicationRecord
  belongs_to :user
  #(PostImageモデルにUserモデルを関連付ける)
  #belongs_toは、PostImageモデルからuser_idに関連付けられていて、Userモデルを参照することが可能。
  #PostImageモデルに関連付けられるのは、1つのUserモデル。このため、単数形の「user」になっている点に注意
  
  attachment :image # ここを追加（_idは含めません）
  has_many :post_comments, dependent: :destroy
  #has_manyでPostCommentモデルを複数持つことを表しています。
  #next  UserモデルとPostCommentモデルを関連付ける
  has_many :favorites, dependent: :destroy
  
  validates :shop_name, presence: true
  validates :image, presence: true
  #投稿画像とショップ名が「必須」入力になるように設定
  #今回、画像投稿に対して「必須入力」の設定が必要なので、PostImageモデルにデータ保存の記述を追加
  
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
  #ここには、favorited_by?メソッドを作成。
  #このメソッドで、引数で渡されたユーザidがFavoritesテーブル内に存在（exists?）するかどうかを調べる。
  #存在していればtrue、存在していなければfalseを返す。
  #のちにfavoriteのviewにて使用する
  #Favoriteモデルへ
end
