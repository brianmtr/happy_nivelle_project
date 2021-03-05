class MaybesController < EventsController

    # PATCH/PUT /events/1 or /events/1.json
    def update
      user = current_user
      event = Event.find(params[:id])



        if UserEvent.where(user_id: user, event_id: event).exists?
          UserEvent.where(user_id: user, event_id: event).update(state: 'maybe')
        else
          user_event = UserEvent.new
          user_event.user = user
          user_event.event = event
          user_event.save
          user_event.maybe!        
        end

        respond_to do |format|
          format.html { redirect_to events_path, notice: "Le vote à été validé, nous avons hâte que vous vous décidiez ;)" }
          end

    end
  
      private
    # Use callbacks to share common setup or constraints between actions.
  
    def userevent_params
      params.fetch(:userevent, {})
    end
    
  end
