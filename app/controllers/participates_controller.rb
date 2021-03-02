class ParticipatesController < EventsController

before_action :set_userevent, only: %i[ new create ]


  # PATCH/PUT /events/1 or /events/1.json
  def update
  user = current_user
  event = Event.find(params[:id])

    if UserEvent.where(state: 'maybe', user_id: user, event_id: event).exists?
      @event.decrement!(:maybe_participate)
    end
    
    if UserEvent.where(state: 'no', user_id: user, event_id: event).exists?
      @event.decrement!(:not_participate)
    end
    
    if @event.increment!(:participate)
      if UserEvent.where(user_id: user, event_id: event).exists?
        UserEvent.where(user_id: current_user, event_id: @event).update(state: 'yes')
      else
        UserEvent.where(user_id: user, event_id: event).upsert(state: "yes", user_id: user, event_id: event) 
      end
    end

    #     if UserEvent.nil?
    #      user_event = UserEvent.new
    #       user_event.user = user
    #       user_event.event = event
    #       user_event.save
    #       user_event.yes!
    #     else
    #       user_event = UserEvent.where(:event_id => @event).update(state: 'yes')
          
    #     end
    # end
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
    @userevent = UserEvent.find(params[:id])
  end

  def userevent_params
    params.fetch(:userevent, {}).permit(:state)
  end
  
end


