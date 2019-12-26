class BokesController < ApplicationController
  def create
    boke = Boke.create(boke_params)
    flash[:notice] = 'ボケを投稿しました'
    redirect_to "/questions/#{boke.question.id}" 
  end

  private
  def boke_params
    params.require(:boke).permit(:boke).merge(user_id: current_user.id, question_id: params[:question_id])
  end
end
