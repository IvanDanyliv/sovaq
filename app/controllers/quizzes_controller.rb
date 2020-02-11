class QuizzesController < ApplicationController
  before_action :find_quiz, only: [:show, :edit, :update, :destroy]

  def index
    @quizzes = Quiz.all
  end

  def new
    @quiz = Quiz.new
  end

  def show
  end

  def edit
  end

  def update
    if @quiz.update_attributes quiz_params
      redirect_to quiz_path
    else
      render 'edit'
    end
  end

  def destroy
    @quiz.destroy
    redirect_to quizzes_path
  end

  def create
    @quiz = Quiz.new quiz_params
    @quiz.user_id = current_user.id
    if @quiz.save
      redirect_to quizzes_path
    else
      render new_quiz_path
    end
  end

  private

  def quiz_params
    params.require(:quiz).permit(:name, questions_attributes: [:question, :img_url, :_destroy])

  end

  def find_quiz
    @quiz = Quiz.find params[:id]
  end
end
