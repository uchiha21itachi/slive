class LivemessagesController < ApplicationController


  def create
    @event = Event.find(params[:event_id])
    @livemessage = Livemessage.new(params_livemessage)
    @livemessage.user = current_user
    @livemessage.event = @event
    if @livemessage.save
      flash[:notice] = "Message sent "
      redirect_to event_live_index_path(@event)
    else
      flash[:notice] = "Some error occured. Message sent failure "
    end
  end

  private

  def params_livemessage
    params.require(:livemessage).permit(:description)
  end
end
