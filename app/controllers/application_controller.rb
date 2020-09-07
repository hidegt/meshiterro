class ApplicationController < ActionController::Base
 before_action :authenticate_user!
 #before_action :configure_permitted_parameters, if: :devise_controller?
 #before_actionメソッドは、このコントローラが動作する前に実行されます。
 #全てのコントローラーで最初に上記のメソッドが実行される
 #:authenticate_user!とすることによって、「ログイン認証されていなければ、ログイン画面へリダイレクトする」機能を実装できます。

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
