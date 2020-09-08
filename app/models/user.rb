class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :post_images, dependent: :destroy
  #(UserモデルにPostImageモデルを関連付ける)
  #dependent: :destroyを指定したクラス：User
  #dependent: :destroyを設定したモデル（のインスタンス）：post_images
  #となるので、Userが消えるとpost_image(s)が消えることになる。
  #次はPostImageモデルにUserモデルを関連付ける
  
  has_many :post_comments, dependent: :destroy
  #next  PostImageモデルとPostCommentモデルを関連付ける
end
