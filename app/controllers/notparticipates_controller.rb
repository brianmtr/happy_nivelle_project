class NotparticipatesController < EventsController

before_action :set_userevent, only: %i[ new create ]


  # PATCH/PUT /events/1 or /events/1.json
  def update
    user = current_user
    event = Event.find(params[:id])



      if UserEvent.where(user_id: user, event_id: event).exists?
        UserEvent.where(user: current_user, event: event).update(state: 'no')
         @vote_participated 
      else
        UserEvent.where(user: user, event: event).upsert(state: "no", user_id: user, event_id: event) 
      end

      respond_to do |format|
        format.html { redirect_to events_path, notice: "Le vote à été validé, nous avons hâte de vous voir une prochaine fois ;)" }
        end
      # if UserEvent.nil?
      #     user_event = UserEvent.where(user: current_user, event: @event).update(state: 'no')
      # else UserEvent.where(user: current_user, event: @event).exists?
      #     user_event = UserEvent.new
      #     user_event.user = user
      #     user_event.event = event
      #     user_event.save
      #     user_event.no!
        
      #   end
 
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
<<<<<<< HEAD
    @userevent = UserEvent.find(params[:id])
=======
    @userevent = Userevent.find(params[:id])
>>>>>>> entire function vote is working, had to change migration, controllers(check update) and views for showing results
  end

  def userevent_params
    params.fetch(:userevent, {})
  end
  
end
