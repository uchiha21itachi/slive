class SurveysController < ApplicationController
  def new
   @survey = Survey.new
   @survey.options.build
  end

  def create
   @survey = Survey.new(survey_params)
   @survey.save
   redirect_to event_live_index_path(params[:event_id])
  end

  def destroy
  end
  private 
  def survey_params
    params.require(:survey).permit(:question, options_attributes: [:choice,:id, :destroy])
  end
end
