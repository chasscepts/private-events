class EventsController < ApplicationController
  def new
    @event = Event.new
    id = session[:current_user_id]
    if !id.nil?
      @user = User.find(id)
    end
  end

  def show
    @event = Event.find(params[:id])
    id = session[:current_user_id]
    if !id.nil?
      @user = User.find(id)
    end
  end

  def index
    @past_events = Event.past.all
    @upcoming_events = Event.upcoming.all
    @events = Event.all
    id = session[:current_user_id]
    if !id.nil?
      @user = User.find(id)
    end
  end

  def create
    @user = User.find(session[:current_user_id])
    @event = @user.created_events.build(event_params)
    if @event.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def event_params
    params.require(:event).permit([:description, :event_date])
  end
end
