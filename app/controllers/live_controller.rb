class LiveController < ApplicationController

  def index
    @livemessage = Livemessage.new
    @event = Event.find(params[:event_id])

    @votes = current_user.votes
    @survey_ids = @votes.map { |v| v.survey_id }
    Pusher.trigger("event-#{@event.token}", 'message', {
      message: 'Hello'
      })
  end





end
 # livemessages:  JSON.generate(@livemessages.pluck(:description)),
      # user_name: JSON.generate(@livemessages.pluck(:user_id))
