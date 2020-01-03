class ShowlikesorderController < ApplicationController

  def showlikesorder
    @question = Question.find(params[:question_id])
    @likes = Like.where(question_id: params[:question_id])
    @likes_top = Boke.find(@likes.group(:boke_id).order('count(boke_id) desc').limit(1).pluck(:boke_id))
    @boke = Boke.new
    @bokes = Boke.find(Like.where(question_id: params[:question_id]).group(:boke_id).order('count(boke_id) desc').limit(10).pluck(:boke_id))
  end

end
