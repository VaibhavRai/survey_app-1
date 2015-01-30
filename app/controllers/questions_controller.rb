class QuestionsController < ApplicationController
  def index
    @surveys = Survey.find(params[:survey_id])
    @questions = @surveys.questions.all
  end

  def new
    @survey = Survey.find(params[:survey_id])
    @question = @survey.questions.new
    4.times do |i|
      @question.options.build
    end
  end

  def create
    @survey = Survey.find(params[:survey_id])
    @question = @survey.questions.new(question_params)
    if @question.save
      flash[:notice] = I18n.t('question.success')
      redirect_to survey_questions_path(@survey)
    else
      flash[:error] = @question.errors.full_messages.join(",")
      render 'new'
    end
  end

  def edit
    @survey = Survey.find(params[:survey_id])
    @question = @survey.questions.find(params[:id])
  end

  def update
    @survey = Survey.find(params[:survey_id])
    @question = @survey.questions.find(params[:id])
    #@option = @question.options.build
    if @question.update_attributes(question_params)
      flash[:notice] = "Question successfully updated"
      redirect_to survey_questions_path(@survey)
    else
      flash[:errors] = "Something went wrong"
      render 'edit'
    end
  end

  def destroy
    @survey = Survey.find(params[:survey_id])
    @question = @survey.questions.find(params[:id])
    if @question.destroy
      flash[:notice] = "Question destroyed successfully"
      redirect_to survey_questions_path(@survey)
    else
      flash[:error] = "Could not destroy"
      redirect_to survey_questions_path(@survey)
    end
  end


  private
  def question_params
    params.require(:question).permit(:description, options_attributes: [:id, :description])
  end
end
