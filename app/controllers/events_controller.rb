class EventsController < ApplicationController
    def index
        @events = Event.all
    end

    def show
        @event = Event.find(params[:id])
    end

    def new
        @event = current_user.created_events.build
    end

    def create
        @event = current_user.created_events.build(event_params)

        if @event.save
            redirect_to user_event_path(current_user, @event), notice: "Event was successfully created."
        else
            render :new, status: :unprocessable_entity
        end
    end

    private

    def event_params
        params.require(:event).permit(:name, :date, :venue)
    end
end
