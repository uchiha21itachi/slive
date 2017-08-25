class LiveController < ApplicationController

  def index
    @livemessage = Livemessage.new
    @event = Event.find(params[:event_id])
  end





end
 # livemessages:  JSON.generate(@livemessages.pluck(:description)),
      # user_name: JSON.generate(@livemessages.pluck(:user_id))
