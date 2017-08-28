class SurveysController < ApplicationController
  def new
   @survey = Survey.new
   @survey.options.build
  end

  def create
    @survey = Survey.new(survey_params)
    @survey.user = current_user
    @survey.event = Event.find(params[:event_id])
    @survey.save
   redirect_to event_live_index_path(params[:event_id])
  end

  def show
    @survey = Survey.find(params[:id])
  end

  def destroy
  end
  private
  def survey_params
    params.require(:survey).permit(:question, options_attributes: [:choice, :id, :destroy])
  end
end
