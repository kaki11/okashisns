class FavoritesController < ApplicationController
  before_action :logged_in_user
  def index
    @favorite_microposts = current_user.favorite_microposts.page(params[:page]).per(15)
  end

  def create
    favorite = Favorite.new
    favorite.user_id = current_user.id
    favorite.micropost_id = params[:micropost_id]

    if favorite.save
      redirect_to micropost_path(params[:micropost_id])
      flash[:success] = 'いいね！しました'
    end
  end

  def destroy
    favorite = Favorite.find_by(micropost_id: params[:micropost_id], user_id: current_user.id)
    if favorite.user_id == current_user.id
      favorite.destroy
      flash[:success] = "削除しました"
      redirect_to micropost_path(params[:micropost_id])
    end
  end
end
