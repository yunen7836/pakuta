class QuestionsController < ApplicationController
  before_action :set_question, only: [:edit, :show]
  before_action :move_to_index, except: [:index, :show]

  def index
    @questions = Question.includes(:user).order("created_at DESC").page(params[:page]).per(5)
  end

  def new
    @question = Question.new
  end

  def create
    Question.create(question_params)
  end

  def destroy
    question = Question.find(params[:id])
    question.destroy
  end

  def edit
  end

  def update
    question = Question.find(params[:id])
    question.update(question_params)
  end

  def show 
    @likes = Like.where(question_id: params[:id])
    if @likes.blank?
      @likes_top = Boke.where(question_id: params[:id]).order("created_at asc").limit(1)
    else
      @likes_top = Boke.find(@likes.group(:boke_id).order('count(boke_id) desc').limit(1).pluck(:boke_id))
    end
    @boke = Boke.new
    @bokes = @question.bokes.includes(:user).order("created_at DESC").page(params[:page]).per(5)
  
  end

  private
  def question_params
    params.require(:question).permit(:image, :title).merge(user_id: current_user.id)
  end

  def set_question
    @question = Question.find(params[:id])
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
