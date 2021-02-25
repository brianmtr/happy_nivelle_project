class ParticipatesController < EventsController
before_action :set_event, only: %i[ update ]
before_action :set_userevent, only: %i[ new create ]
before_action :set_user

  # PATCH/PUT /events/1 or /events/1.json
  def update
    if @event.increment!(:participate)
    @userevent = Userevent.upsert(
      state: "yes",
      events_id: @event.id,
      users_id: current_user.id
    )
    end
  end

    private
  # Use callbacks to share common setup or constraints between actions.
  def set_event
    @event = Event.find(params[:id])
  end

  def set_user
    @user = User.find(params[:id])
  end

  def set_userevent
    @userevent = Userevent.find(params[:id])
  end

  def userevent_params
    params.fetch(:userevent, {})
  end
  
end


