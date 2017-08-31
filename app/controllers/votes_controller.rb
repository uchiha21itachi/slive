class VotesController < ApplicationController
	def index
		@votes = Vote.all
	end

	def new
		@vote = Vote.new
	end

	def create
		@vote = current_user.votes.build(vote_params)
		@survey = Survey.find(params[:survey_id])
		@vote.survey = @survey
    @event = @survey.event
		respond_to do |format|
      if @vote.save
        Pusher.trigger("event-#{@event.token}", 'survey_votes', {
          vote: @vote.option.choice
        })
        pie_chart_votes(@survey)
				format.html do
          redirect_to event_live_index_path(params[:event_id])
        end
				format.js # this renders create.js.erb
			else
				format.html { render :new }
				format.js
			end

		end
	end

  def pie_chart_votes(survey)
    @survey = survey
    data = @survey.options.map(&:as_json)

    Pusher.trigger("event-#{@event.token}", 'survey_pie_chart', {
          votes: JSON.parse(data.to_json),
          id: @survey.id,
          title: @survey.question
        })
  end

	def show
		@vote = params[:vote_casted]
	end
	private
	def vote_params
		params.require(:vote).permit(:option_id)
	end
end


