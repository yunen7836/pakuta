class RankingController < ApplicationController

  def likesorder
    @questions = Question.create_likesorder
  end

end
