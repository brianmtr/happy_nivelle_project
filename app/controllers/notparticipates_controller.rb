class NotparticipatesController < EventsController
  before_action :set_event, only: [:update]

  # PATCH/PUT /events/1 or /events/1.json
  def update
    if @event.increment!(:not_participate)
      @event = userevent.id
      @user = userevent.id
      @userevent.state = "no"
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_event
    @event = Event.find(params[:id])
  end
end
