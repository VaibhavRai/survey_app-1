class SurveysController < ApplicationController
  def index
    @surveys = Survey.all
  end

  def new
    @survey = Survey.new
   # @survey.questions.build
  end

  def create
    @survey = Survey.new(survey_params_create)
    if @survey.save
      flash[:notice] = "Survey successfully created"
      redirect_to root_path
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end

  def show
    @survey = Survey.find(params[:id])
  end

  def edit
    @survey = Survey.find(params[:id])
  end

  def update
    @survey = Survey.find(params[:id])
    if @survey.update_attributes(survey_params_create)
      flash[:notice] = "Survey successfully updated"
      redirect_to root_path
    else
      flash[:error] = "Something went wrong"
      render 'edit'
    end
  end

  def destroy
    @survey = Survey.find(params[:id])
    if @survey.destroy
      flash[:notice] = "Survey destroyed successfully"
      redirect_to root_path
    else
      flash[:error] = "Could not destroy"
      redirect_to root_path
    end
  end

  private
  def survey_params_create
    params.require(:survey).permit(:name, :survey_type, :conducted_on, :count_people)
  end

end
