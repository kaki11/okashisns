class CommentsController < ApplicationController
  def create
    # hidden_fieldの値を受け取る
    @micropost = Micropost.find_by(params[:id])
    if current_user
      @comment = current_user.comments.build(comment_params)
      if @comment.save!
        redirect_back(fallback_location: root_path)
      else
        redirect_back(fallback_location: root_path)
      end
    else
      
      if @comment.save
        redirect_back(fallback_location: root_path)
      else
        redirect_back(fallback_location: root_path)
      end
    end

  end

  private
  def comment_params
    params.require(:comment).permit(:content, :micropost_id)
  end
end
