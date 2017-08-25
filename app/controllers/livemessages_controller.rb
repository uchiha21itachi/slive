class LivemessagesController < ApplicationController


  def create
    @event = Event.find(params[:event_id])
    @livemessage = Livemessage.new(params_livemessage)
    @livemessage.user = current_user
    @livemessage.event = @event
    if @livemessage.save
      flash[:notice] = "Message sent "

      Pusher.trigger("event-#{@event.token}", 'livemessage', {
      message: @livemessage.description,
      user: @livemessage.user.email
      })
      redirect_to event_live_index_path(@event)
    else
      flash[:notice] = "Some error occured. Message sent failure "
    end
  end

  # def index
  #   # @event = Event.find(params[:event_id])
  #   @livemessage = @event.livemessages
  #   Pusher.trigger("event-#{@event.token}", 'livemessage', {
  #     livemessages:  "#{@livemessages}"
  #     })
  # end
  private

  def params_livemessage
    params.require(:livemessage).permit(:description)
  end
end
