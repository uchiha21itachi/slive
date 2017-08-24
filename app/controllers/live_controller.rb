class LiveController < ApplicationController
  def index
    @livemessage = Livemessage.new
    @event = Event.find(params[:event_id])
    Pusher.trigger("event-#{@event.token}", 'message', {
      message: 'Hello'
      })

    @description = []
    @user_name = []
    @livemessages = @event.livemessages
    @livemessages.each do |livemessage|
      @description << livemessage.description
      @user_name << livemessage.user.email
    end
    Pusher.trigger("event-#{@event.token}", 'livemessage', {
      livemessages: @description,
      user: @user_name
      })


  end

end
 # livemessages:  JSON.generate(@livemessages.pluck(:description)),
      # user_name: JSON.generate(@livemessages.pluck(:user_id))
