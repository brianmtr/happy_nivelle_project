class Admin::CancelController < Admin::EventsController

    def update
        @event = Event.find(params[:id])
        @event.update(status: "cancel")
        redirect_to "/admin/events/", notice: "L'événement à bien été annulé"
    end
end
