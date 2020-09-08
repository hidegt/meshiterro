class UsersController < ApplicationController
  #マイページ用のコントローラー
  def show
    @user = User.find(params[:id])
    @post_images = @user.post_images.page(params[:page]).reverse_order
    #@userに関連付けられた投稿（.post_images）のみ、@post_imagesに渡すことができます。
    #また、全体の投稿ではなく、個人が投稿したもののみを表示できます。
  end
end
