class QuizzesController < ApplicationController
  class PostsController < ApplicationController
    before_action :find_quiz, only: [:show, :edit, :update, :destroy]

    def index
      @quiz = Quiz.all
    end

    def new
      @post = Quiz.new
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
      redirect_to
    end

    def create
      @quiz = Post.new post_params
      if @quiz.save
        redirect_to @quiz
      else
        render 'new'
      end
    end

    private

    def quiz_params
      params.require(:post).permit(:name, questions_attributes: [:id, :question, :_destroy])
    end

    def find_post
      @quiz = Quiz.find params[:id]
    end
  end

end
