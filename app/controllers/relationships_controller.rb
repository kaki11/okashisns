class RelationshipsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]

  def create
    user = User.find(params[:follow_id])
    following = current_user.relationships.find_or_create_by(follow_id: user.id)
    if following.save
      flash[:success] = 'フォローしました'
      redirect_to user
    else
      flash.now[:alert] = 'フォローに失敗しました'
      redirect_to user
    end
  end

  def destroy
    user = User.find(params[:follow_id])
    following = current_user.relationships.find_by(follow_id: user.id)

    if following.nil?
      flash.now[:alert] = "すでにフォロー済みだよ"
      redirect_to user
    elsif following.destroy
      flash[:success] = 'フォローを解除しました'
      redirect_to user
    else
      flash.now[:alert] = 'フォロー解除に失敗しました'
      redirect_to user
    end
  end
  

end
