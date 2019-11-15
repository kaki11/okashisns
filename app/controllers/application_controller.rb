class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  before_action :set_search
  def set_search
    @search = Micropost.ransack(params[:q]) #ransackメソッド推奨
    @search_microposts = @search.result.page(params[:page]).per(15)
  end

  private

  # ユーザーのログインを確認する
  def logged_in_user
    unless logged_in?
      flash[:danger] = "ログインしてください"
      redirect_to login_url
    end
  end
end
