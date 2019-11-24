class CommentsController < ApplicationController

  def create
    # hidden_fieldの値を受け取る
    @micropost = Micropost.find_by(params[:id])

    if !current_user.blank?
      @comment = current_user.comments.build(comment_params)
      if @comment.save ? flash[:success] = "コメントしました" : flash[:danger] = "コメントできませんでした"
        redirect_back(fallback_location: root_path)
      end 
    else
      @comment = Comment.new(comment_params)
      if @comment.save ? flash[:success] = "コメントしました" : flash[:danger] = "コメントできませんでした"
        redirect_back(fallback_location: root_path)
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @micropost = Micropost.find_by(user_id:current_user.id)

    # ロングインしているユーザーが投稿した記事ならさくじょできる
    if @micropost.user_id == current_user.id
      @comment.destroy ? flash[:success] = "削除しました" : flash[:danger] = "削除できませんでした"
      redirect_back(fallback_location: root_path)
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content, :micropost_id)
  end

end
