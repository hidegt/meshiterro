class UsersController < ApplicationController
  #マイページ用のコントローラー
  def show
    @user = User.find(params[:id])
    @post_images = @user.post_images.page(params[:page]).reverse_order
    #@userに関連付けられた投稿（.post_images）のみ、@post_imagesに渡すことができます。
    #また、全体の投稿ではなく、個人が投稿したもののみを表示できます。
  end
  
  def edit
    @user = User.find(params[:id])
    #params[:id]でユーザの情報を取得してインスタンス（@user）に保存し、編集用Viewでform_withを使う準備
  end
  
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end
  
  #updateがあるため、下記追記
  private
  def user_params
    params.require(:user).permit(:name, :profile_image)
  end
end
