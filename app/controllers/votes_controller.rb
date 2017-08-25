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

		respond_to do |format|

			if @vote.save
				format.html { redirect_to event_live_index_path(params[:event_id]) }
				format.js # this renders create.js.erb
			else
				format.html { render :new }
				format.js
			end

		end

	end

	def show 
		@vote = params[:vote_casted]
	end
	private
	def vote_params
		params.require(:vote).permit(:option_id)
	end
end


