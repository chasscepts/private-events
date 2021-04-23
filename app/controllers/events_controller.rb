class EventsController < ApplicationController
    def new
        @event = Event.new
    end

    def show
        @event = Event.find(params[:id])
    end

    def index
        @events = Event.all
    end

    def create
        user = User.find(session[:current_user_id])
        @event = user.created_events.build(post_params)
        if @event.save
          redirect_to root_path
        else
          render :new
        end
    end
end
