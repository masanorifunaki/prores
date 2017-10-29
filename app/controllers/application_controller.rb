class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_filter :basic
  
  private
  def basic
    authenticate_or_request_with_http_basic do |user, pass|
      user == 'funaki' && pass == 'pass'
    end
  end

  #全ビュー共通
  before_action :set_current_user

  def set_current_user
    @current_user = User.find_by(id: session[:user_id])
  end

  #ログインしていない場合の処理
  def authenticate_user
    if @current_user == nil
      flash[:notice] = "ログインが必要です"
      redirect_to("/login")
    end
  end

  #ログインしている場合の処理
  def forbid_login_user
    if @current_user
      flash[:notice] = "すでにログインしています"
      redirect_to("/posts/index")
    end
  end
end
