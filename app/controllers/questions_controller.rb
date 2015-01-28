class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
    4.times do |i| 
      @question.options.build
    end
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      flash[:notice] = I18n.t('question.success')
      redirect_to questions_path
    else
      flash[:error] = @question.errors.full_messages.join(",")
      render 'new'
    end
  end

  private

  def question_params
    params.require(:question).permit(:description, options_attributes: [:description])
  end
end
