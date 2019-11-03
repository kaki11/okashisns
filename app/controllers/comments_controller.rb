class CommentsController < ApplicationController

  def create
    # hidden_fieldの値を受け取る
    @micropost = Micropost.find_by(params[:id])
    if current_user
      @comment = current_user.comments.build(comment_params)
      if @comment.save
        redirect_back(fallback_location: root_path)
      else
        redirect_back(fallback_location: root_path)
        flash[:danger] = "こめんとがないよ＞＜"
      end
    else
      @comment = Comment.new(comment_params)
      if @comment.save
        redirect_back(fallback_location: root_path)
      else
        redirect_back(fallback_location: root_path)
        flash[:danger] = "こめんとがないよ＞＜"
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @micropost = Micropost.find_by(user_id:current_user.id)
    if @micropost.user_id == current_user.id
      @comment.destroy
      flash[:success] = "削除しました"
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
      flash[:danger] = "削除できません＞＜"
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content, :micropost_id)
  end

end
