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
    user_vote(@survey)
	end

  # def user_vote(survey)
  #   @survey = survey
  #   @votes = current_user.votes
  #   @survey_ids = @votes.map { |v| v.survey_id }
  #   if @survey_ids.include?(@survey.id)
  #     @vote = @votes.find{ |v| v.survey_id == @survey.id}
  #   else
  #     @vote = "No vote"
  #   end
  #   Pusher.trigger("event-#{@event.token}", 'survey_votes', {
  #         vote: @vote
  #       })
  # end

  def pie_chart_votes(survey)
    @survey = survey
    # pie_chart @survey.votes.group(:option_id).count
    Pusher.trigger("event-#{@event.token}", 'survey_pie_chart', {
          votes: @survey.votes
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


