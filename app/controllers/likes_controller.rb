class LikesController < ApplicationController
  
  def create
    @like = current_user.likes.new(boke_id: params[:boke_id],question_id: params[:question_id])
    if @like.save
      redirect_to "/questions/#{params[:question_id]}"
    end
  end

  def destroy

    @like = Like.find_by(user_id: current_user.id, boke_id: params[:boke_id])
    if @like.destroy
      redirect_to "/questions/#{params[:question_id]}"
    end
  end

end