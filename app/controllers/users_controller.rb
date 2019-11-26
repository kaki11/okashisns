class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update, :destroy]

  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.page(params[:page]).per(15)
    @favorites_count = Favorite.where(micropost_id: @microposts.ids).count
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "登録が完了しました！"
      redirect_to @user
    else
      render :new
      flash.now[:danger] = "登録出来ませんでした"
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "編集しました"
      redirect_to user_path(current_user)
    else
      render :edit
      flash.now[:danger] = "編集出来ませんでした"
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.id == current_user.id
      @user.destroy
      flash[:success] = "アカウントを削除しました"
      redirect_to root_path
    else
      render :edit
      flash.now[:danger] = "アカウントを削除出来ませんでした"
    end
  end

  def following
    @user = User.find(params[:id])
  end

  def followers
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end
  
end
