class QuizzesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_quiz, only: %i[show edit update destroy]

  def index
    @quiz = Quiz.all
  end

  def new
    @quiz = Quiz.new
  end

  def show
  end

  def edit
  end

  def update
    if @quiz.update quiz_params
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
    if @quiz.save
      redirect_to @quiz
    else
      render 'new'
    end
  end

  private

  def quiz_params
    params.require(:quiz).permit(:name, questions_attributes: [:id, :question, :_destroy,
                                 answers_attributes: [:id, :answer, :is_true, :_destroy]])
  end

  def find_quiz
    @quiz = Quiz.find params[:id]
  end
end
