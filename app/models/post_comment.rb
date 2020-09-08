class PostComment < ApplicationRecord
  belongs_to :user
  belongs_to :post_image
  #UserモデルもPostImageモデルも関連付けられるのは1つのため、belongs_to
  #Userモデル、PostImageモデル、PostCommentモデルのモデル同士の関連付け(アソシエーションの設定)
end
