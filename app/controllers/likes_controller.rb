class LikesController < ApplicationController
  
  def create
    @like = current_user.likes.new(boke_id: params[:boke_id])
    if @like.save
      flash[:success] = "いいねしました"
      redirect_to "/questions/#{params[:question_id]}"
    end
  end

  def destroy

    @like = Like.find_by(user_id: current_user.id, boke_id: params[:boke_id])
    if @like.destroy
      flash[:success] = "いいね解除しました"
      redirect_to "/questions/#{params[:question_id]}"
    end
  end

end