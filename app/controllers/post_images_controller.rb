class PostImagesController < ApplicationController
  def new
    @post_image = PostImage.new
  end
  
  def create
    @post_image = PostImage.new(post_image_params)
    @post_image.user_id = current_user.id
    if @post_image.save
      redirect_to post_images_path
    else
      render :new
      #render :アクション名で、同じコントローラ内の別アクションのViewを表示できます。
      #表示先の変数に注意
    end
  end
  
  def index
    #@post_images = PostImage.all　postimagesテーブル内の全データ取得（とても見にくくなる）
    @post_images = PostImage.page(params[:page]).reverse_order
    #1ページ分の決められた数のデータだけを、新しい順に取得するように変更。
    #pageメソッドは、kaminariをインストールしたことで使用可能になったメソッド
    #ページあたりに表示させる件数の設定は、config/initializersフォルダのkaminari_config.rbファイルに記述
    
  end
  
  def show
    @post_image = PostImage.find(params[:id])
    @post_comment = PostComment.new
  end
  
  private
  def post_image_params
    params.require(:post_image).permit(:shop_name, :image, :caption)
  end
  
end
