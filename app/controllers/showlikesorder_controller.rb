class ShowlikesorderController < ApplicationController

  def showlikesorder
    @question = Question.find(params[:question_id])
    @likes = Like.where(question_id: params[:question_id])
    @likes_top = Boke.find(@likes.group(:boke_id).order('count(boke_id) desc').limit(1).pluck(:boke_id))
    if @likes_top.blank?
      @likes_top = Boke.where(question_id: params[:question_id]).order("created_at asc").limit(1)
      @boke = Boke.new
      @bokes = @question.bokes.includes(:user).order("created_at asc").page(params[:page]).per(5)
    else
      @boke = Boke.new
      @bokes = Boke.find(Like.where(question_id: params[:question_id]).group(:boke_id).order('count(boke_id) desc').limit(10).pluck(:boke_id))
    end
  end

end
