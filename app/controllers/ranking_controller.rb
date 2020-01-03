class RankingController < ApplicationController

  def likesorder
    @questions = Question.create_likesorder
    if @question.blank?
      @questions = Question.includes(:user).order("created_at DESC").page(params[:page]).per(5)
    end
  end

end
