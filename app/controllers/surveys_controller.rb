class SurveysController < ApplicationController
  def new
   @survey = Survey.new
   @survey.options.build
  end

  def create
    @survey = Survey.new(survey_params)
    @survey.user = current_user
    @event = Event.find(params[:event_id])
    @survey.event = @event

    if @survey.save

      html = render_to_string partial: "show_survey", locals: { event: @event, survey: @survey, vote: Vote.new }

      Pusher.trigger("event-#{@event.token}", 'survey', {
        survey: @survey.question,
        survey_html: html,
        user: @survey.user.email
      })
     redirect_to event_live_index_path(@event)
    else
      render 'form_for_survey'
    end
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
