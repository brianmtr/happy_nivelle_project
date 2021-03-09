class ValidateController < EventsController

def validate
    @event = Event.find(params[:id])
    status = @event.status 
  case status
    when nil
      @event.status = 'proposed'
      @event.save
      redirect_to '/events/', notice: "l'évenement a bien été accepté."
  
    when 'proposed' 
     @event.status = 'accepted'
      @event.save
      redirect_to '/events/', notice: "l'évenement a bien été accepté."

    when 'accepted'
      @event.status = 'past'
      @event.save
      redirect_to '/events/', notice: "l'évenement a bien été accepté."
  end
end


private


def event_params
    params.require(:event).permit(:title, :date, :adress, :description, :image)

  end
end