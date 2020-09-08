class PostImage < ApplicationRecord
  belongs_to :user
  #(PostImageモデルにUserモデルを関連付ける)
  #belongs_toは、PostImageモデルからuser_idに関連付けられていて、Userモデルを参照することが可能。
  #PostImageモデルに関連付けられるのは、1つのUserモデル。このため、単数形の「user」になっている点に注意
  
  attachment :image # ここを追加（_idは含めません）
  has_many :post_comments, dependent: :destroy
  #has_manyでPostCommentモデルを複数持つことを表しています。
  #next  UserモデルとPostCommentモデルを関連付ける
end
