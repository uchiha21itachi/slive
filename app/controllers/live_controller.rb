class LiveController < ApplicationController

  def index
    @livemessage = Livemessage.new
    @event = Event.find(params[:event_id])

    @ordered_objects = (@event.surveys.to_a + @event.livemessages.to_a).sort_by{|o| o.created_at}


  end





end
 # livemessages:  JSON.generate(@livemessages.pluck(:description)),
      # user_name: JSON.generate(@livemessages.pluck(:user_id))
 # Pusher.trigger("event-#{@event.token}", 'message', {
 #      message: 'Hello'
 #      })
