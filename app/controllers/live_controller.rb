class LiveController < ApplicationController
  def index
    @event = Event.find(params[:event_id])
    Pusher.trigger("event-#{@event.token}", 'message', {
      message: 'Hello'
      })
  end

end
