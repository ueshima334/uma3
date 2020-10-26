class SurveysController < ApplicationController

def index
  @surveys = Survey.all.order('created_at DESC')
end

def new
  @survey = Survey.new
end

def create
  survey = Survey.new(survey_params)  

  if survey.save
    redirect_to surveys_path
  else
    @survey = Survey.new
    render :new
  end

end

def show
  @survey = Survey.find(params[:id])
  @vote = Vote.new
end

private

def survey_params
  params.require(:survey).permit(:title,:item1,:item2,:item3,:item4)
end

end
