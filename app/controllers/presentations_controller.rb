class PresentationsController < ApplicationController

  def index
    @event = Event.find(params[:event_id])
    @presentations = Presentation.all
  end

  def new
    @event = Event.find(params[:event_id])
    @presentation = Presentation.new
  end

  def create
    @event = Event.find(params[:event_id])
    @presentation = Presentation.new(presentation_params)
    @presentation.event = @event
    if @presentation.save
      redirect_to event_presentation_path(@event, @presentation)
    else
      render :new
    end
  end

  def show
    @presentation = Presentation.find(params[:id])
  end

  private

  def presentation_params
    params.require(:presentation).permit(:name, :pdf_file, :pdf_file_cache)
  end

end
