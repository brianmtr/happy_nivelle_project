class NotparticipatesController < EventsController
  before_action :set_event, only: [:update]

  # PATCH/PUT /events/1 or /events/1.json
  def update
    user = User.find(params[:id])
    event = Event.find(params[:id])

    if UserEvent.where(:state => 'maybe')
      @event.decrement!(:maybe_participate)
    end
    
    if UserEvent.where(:state => 'yes')
      @event.decrement!(:participate)
    end

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
