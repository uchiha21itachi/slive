class EventsController < ApplicationController

  before_action :set_event, only: [:edit, :show, :update, :destroy]

  def index
    @events = Event.where(user: current_user)
  end


  def participated_events
    @events = Event.where(presenter: params[current_user])
    # @your_events = []
    # @events.each do |event|
    #   participants_events = event.events_users
    #   participants_events.each do |participant|
    #     if participant == current_user
    #       @your_events << event
    #     end
    #   end
    # end
  end

  def register_users
    @event = Event.find_by(token: params[:token])
    if current_user == @event.presenter
      redirect_to root_path
    elsif @event.users.include?(current_user)
      redirect_to event_path(@event)
    else
      @event.users << current_user
      @event.save
      redirect_to event_path(@event)
    end
  end
  def show
    @event = Event.find(params[:id])
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

  def create_token
  end
end
