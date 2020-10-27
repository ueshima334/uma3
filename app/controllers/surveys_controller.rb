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
  
  total_vote
end

private

def survey_params
  params.require(:survey).permit(:title,:item1,:item2,:item3,:item4)
end

def total_vote

  n = 0
  @total_vote = []
  
  4.times do 
    n += 1
    if @survey.send("item#{n}") != ""
   eval "@vote#{n}=Vote.where(vote_id:@survey.id,select: n )"
   @total_vote << [ @survey.send("item#{n}") , (eval"@vote#{n}").count ]
    else
  break
    end
  end
  @number = n
end  
end
