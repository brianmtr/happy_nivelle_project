class MaybesController < EventsController
    before_action :set_event, only: [ :update ]

      # PATCH/PUT /events/1 or /events/1.json
  def update
    @event.increment!(:maybe_participate)
    @userevents_in_maybe  = 'maybe'
  end



    private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end
  
end
