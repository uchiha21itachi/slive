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
      redirect_to event_path(@event)
    else
      render :new
    end
  end

  def show
    @presentation = Presentation.find(params[:id])
  end

  def destroy
    @event = Event.find(params[:event_id])
    @presentation = @event.presentation
    @presentation.destroy
    redirect_to event_path(@event), notice: 'presentation was successfully deleted.'
  end

  private

  def presentation_params
    params.require(:presentation).permit(:name, :pdf_file, :pdf_file_cache)
  end

end
