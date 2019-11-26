class FavoritesController < ApplicationController
  before_action :logged_in_user

  def index
    @microposts_count = current_user.favorite_microposts.count
    @favorite_microposts = current_user.favorite_microposts.page(params[:page]).per(15)
  end

  def create
    favorite = Favorite.new(user_id: current_user.id)
    favorite.micropost_id = params[:micropost_id]

    if favorite.save ? flash[:success] = "お気に入りに登録しました" : flash[:danger] = "お気に入りに登録できませんでした"
      redirect_to micropost_path(params[:micropost_id])
    end
  end

  def destroy
    favorite = Favorite.find_by(micropost_id: params[:micropost_id], user_id: current_user.id)
    favorite.user_id == current_user.id
    if favorite.destroy ? flash[:success] = "お気に入りから削除しました" : flash[:danger] = "お気に入りから削除できませんでした"
      redirect_to micropost_path(params[:micropost_id])
    end
  end

end