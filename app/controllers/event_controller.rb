class EventController < ApplicationController
    def index
        @events = Event.all
    end

    def add_attender
        @event = Event.find_by_id(params[:id])
        @event.users << current_user
        redirect_to event_path(@event)
    end

    def new
        @event = Event.new
    end

    def create
        @event = Event.create(event_params)
        redirect_to user_path(current_user)
    end

    def show
        @event = Event.find_by_id(params[:id])
        @attending = Event.find_by_id(params[:id]).users
    end

    def edit
        @event = Event.find_by_id(params[:id])
    end

    def update
        updated_event = Event.find_by_id(params[:id])
        if updated_event.update(event_params)
            redirect_to user_path(current_user)
        else
            redirect_to edit_event_path
        end
    end

    def destroy
        deleted_event = Event.find_by_id(params[:id])
        Event.destroy(deleted_event)
        redirect_to user_path(current_user)
    end

    private

    def event_params
        params.require(:event).permit(:title, :body, :date, :category, :price, :address, :user_id)
    end
end
