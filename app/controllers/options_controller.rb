class OptionsController < ApplicationController
  def index
    @questions = Question.find(params[:question_id])
    @options = @questions.options.all
  end
end
