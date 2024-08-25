class AttendancesController < ApplicationController
    before_action :set_event
    def create
        @attendance = @event.attendances.build(user: current_user)

        if @attendance.save
            redirect_to user_event_path(@event.creator_id, @event), notice: "You are now attending this event!"
        else
            redirect_to @event, alert: "Unable to join this event."
        end
    end

    def destroy
        @attendance = @event.attendances.find_by(user: current_user)

        if @attendance
            @attendance.destroy
            redirect_to user_event_path(@event.creator_id, @event), notice: "You are no longer attending this event!"
        else
            redirect_to @event, alert: "You were not originally attending this event."
        end
    end

    private

    def set_event
        @event = Event.find(params[:event_id])
    end
end
