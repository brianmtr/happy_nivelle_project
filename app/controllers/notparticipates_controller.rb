class NotparticipatesController < EventsController

before_action :set_userevent, only: %i[ new create ]


  # PATCH/PUT /events/1 or /events/1.json
  def update
    user = current_user
    event = Event.find(params[:id])

    if UserEvent.where(:state => 'maybe')
      @event.decrement!(:maybe_participate)
    end
    
    if UserEvent.where(:state => 'yes')
      @event.decrement!(:participate)
    end

    if @event.increment!(:not_participate)
      if UserEvent.nil?
          user_event = UserEvent.where(user: current_user, event: @event).update(state: 'no')
      else UserEvent.where(user: current_user, event: @event).exists?
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
    @userevent = UserEvent.find(params[:id])
  end

  def userevent_params
    params.fetch(:userevent, {})
  end
  
end
