class ParticipateController < EventsController
before_action :set_event, only: [:show, :edit, :update, :destroy, :participate, :maybe_participate, :not_participate]

    def participate
        @event = Event.find(params[:id])
        @event.participate = 1
        @event.save
        redirect_to event_path
    end

    def maybe
        @event = Event.find(params[:id])
        @event.maybe_participate = 1
        @event.save
        redirect_to event_path
    end

    def notparticipate
        @event = Event.find(params[:id])
        @event.not_participate = 1
        @event.save
        redirect_to event_path
    end


    private
  # Use callbacks to share common setup or constraints between actions.
  def set_event
    @event = Event.find(params[:id])
  end


  # Only allow a list of trusted parameters through.
  def params_event
    params.require(:event).permit(:title, :date, :adress, :description, :image, :participate)

  end
end