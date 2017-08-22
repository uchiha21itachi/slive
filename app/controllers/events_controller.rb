class EventsController < ApplicationController

  before_action :set_event, only: [:edit, :show, :update, :destroy]

  def index
    @events = Event.where(params[user: current_user])
  end

<<<<<<< HEAD
=======

>>>>>>> 35a237a3723b5025a84a3f26eaa5ae2f3477af5c
  def participated_events
    @events = Event.all
    @your_events = []
    @events.each do |event|
<<<<<<< HEAD
      participants_events = event.events_users
=======
      participants_events = @events.events_users
>>>>>>> 35a237a3723b5025a84a3f26eaa5ae2f3477af5c
      participants_events.each do |participant|
        if participant == current_user
          @your_events << event
        end
      end
    end
  end

  def show
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.user = current_user
    if @event.save
      redirect_to event_path(@event)
    else
      render :new
  end

  def edit
  end

  def update
    @user =  current_user
    if @event.update(event_params)
      redirect_to event_path(@event), notice: 'Event was successfully updated.'
    else
      render :edit
  end

  def destroy
    @event.destroy
    redirect_to events_path, notice: 'Event was successfully deleted.'
  end

private

  def event_params
    params.require(:event).permit(:name, :date, :time, :description, :address)
  end

  def set_event
    @event = Event.find(params[:id])
  end

  def creat_token
  end
end
