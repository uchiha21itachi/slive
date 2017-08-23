class EventsController < ApplicationController

  before_action :set_event, only: [:edit, :show, :update, :destroy]

  def index
    @events = Event.where(user: current_user)
  end

  def created_events
    @events = Event.where(presenter: current_user)
  end

  def register_users
    @event = Event.find_by(token: params[:token])
    if current_user == @event.presenter
      flash[:notice] = "Your are presenting. Welcome to your event "
      redirect_to event_path(@event)
    elsif @event.users.include?(current_user)
      flash[:notice] = "welcome to the event"
      redirect_to event_path(@event)
    else
      @event.users << current_user
      @event.save
      flash[:notice] = "welcome to the event. Joined the event successfully"
      redirect_to event_path(@event)
    end
  end

  def remove_user_from_event
    @event = Event.find(params[:event_id])
    @user = User.find(params[:id])
    @event.users.delete(@user)
    if @event.save
      flash[:notice] = "Successfully removed the user from list"
      redirect_to event_path(@event)
    else
      flash[:notice] = "Error cant remove the user"
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
    @event.token = create_token
    @event.presenter = current_user
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
    @token = (0..8).map { ('a'..'z').to_a[rand(26)] }.join
  end
end
