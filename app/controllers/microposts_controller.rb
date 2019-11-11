class MicropostsController < ApplicationController
  before_action :logged_in_user, only: [:new, :create, :edit, :update, :destroy]
  before_action :correct_user,   only: :destroy

  def index
    @microposts_all = Micropost.all
    @microposts = Micropost.all.page(params[:page]).per(10)
  end

  def show
    @micropost = Micropost.find(params[:id])
    @comments = @micropost.comments.all.page(params[:page]).per(10)
    @comment = Comment.new
  end

  def new
    @micropost = Micropost.new
  end

  def create
    # モデルを関連付けしたときにbuildを使う newのエイリアス
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = "投稿しました"
      redirect_to current_user
    else
      render :new
    end
  end

  def edit
    @micropost = Micropost.find(params[:id])
  end

  def update
    @micropost = Micropost.find(params[:id])
    if @micropost.update_attributes!(micropost_params)
      flash[:success] = '編集しました'
      redirect_to micropost_path(@micropost)
    else
      render :edit
    end
  end

  def destroy
    if @micropost.user_id == current_user.id
        @micropost.destroy
        flash[:success] = "削除しました"
        redirect_to current_user
    else
      flash.now[:danger] = "削除出来ません"
    end
  end

  def search
  end

  def category
    @category = Category.find(params[:id])
    @category_microposts = Micropost.where(category_id: @category.id).page(params[:page]).per(10)
  end

  private

    def micropost_params
      params.require(:micropost).permit(:title, :content, :picture, :category_id)
    end

    def correct_user
      @micropost = current_user.microposts.find_by(id: params[:id])
      redirect_to root_url if @micropost.nil?
    end

end
