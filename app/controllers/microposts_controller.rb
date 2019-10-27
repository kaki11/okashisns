class MicropostsController < ApplicationController
  before_action :logged_in_user, only: [:new, :create, :edit, :update, :destroy]
  before_action :correct_user,   only: :destroy

  def show
    @micropost = Micropost.find(params[:id])
  end

  def new
    @micropost = Micropost.new
  end

  def create
    @micropost = current_user.microposts.new(micropost_params)
    if @micropost.save
      flash[:success] = "投稿しました"
      redirect_to current_user
    else
      render :new
    end
  end

  def destroy
    @micropost.destroy
    flash[:success] = "削除しました"
    #  redirect_back(fallback_location: root_url)と同じ意味
    redirect_to request.referrer || root_url
  end

  private

    def micropost_params
      params.require(:micropost).permit(:title, :content, :picture)
    end

    def correct_user
      @micropost = current_user.microposts.find_by(id: params[:id])
      redirect_to root_url if @micropost.nil?
    end

end
