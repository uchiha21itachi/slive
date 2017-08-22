class EventsController < ApplicationController

  before_action :set_event,  only: [:edit, :show, :update, :destroy]

  def index
    @events = Event.all
  end

  def show
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to
    else
      render :new
  end

  def edit
  end

  def update
    if @event.update(event_params)
      redirect_to
    else
      render :edit
  end

  def destroy
    @event.destroy
    redirect_to
  end

private

  def event_params
    params.require(:event).permit(:name, :date, :time, :description, :address, :token)
  end

  def set_event
    @event = Event.find(params[:id])
  end
end
