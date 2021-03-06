class EventsController < ApplicationController
  before_action :set_bar, only: [:new, :create]
  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = @bar.events.build(event_params)
    @event.bar = @bar

    if @event.save
      redirect_to bar_path(@bar)
    else
      render :new
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    @event.update(event_params)
    redirect_to event_path(@event)
  end

  def attend
    @event = Event.find(params[:id])
    current_user.events << @event
    redirect_to @event
  end

  def destroy
  end

  private

  def event_params
    params.require(:event).permit(:title, :date, :photo, :photo_cache)
  end

  def set_bar
    @bar = Bar.find(params[:bar_id])
  end
end
