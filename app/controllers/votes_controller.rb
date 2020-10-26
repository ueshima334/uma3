class VotesController < ApplicationController

  def create
    vote = Vote.create(params.require(:vote).permit(:select).merge(user_id:current_user.id,vote_id:params[:survey_id]))
     if vote.save
      redirect_to survey_path(params[:survey_id])
     else
      render template: 'surveys/show'
     end
    end

end
