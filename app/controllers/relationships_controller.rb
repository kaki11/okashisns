class RelationshipsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]

  def create
    user = User.find(params[:follow_id])
    following = current_user.relationships.find_or_create_by(follow_id: user.id)
    if following.save ? flash[:success] = "フォローしました" : flash[:danger] = "フォローできませんでした"
      redirect_to user
    end
  end

  def destroy
    user = User.find(params[:follow_id])
    following = current_user.relationships.find_by(follow_id: user.id)
    if following.destroy ? flash[:success] = "フォローを解除しました" : flash[:danger] = "フォローを解除できませんでした"  
      redirect_to user
    end
  end
  
end
