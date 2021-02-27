class NotparticipatesController < EventsController
  before_action :set_event, only: %i[ update ]
before_action :set_userevent, only: %i[ new create ]
before_action :set_user

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
        if UserEvent.exists?
          user_event = UserEvent.update(state: 'no')
        else
          user_event = UserEvent.new
          user_event.user = user
          user_event.event = event
          user_event.save
          user_event.no!
        end
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
