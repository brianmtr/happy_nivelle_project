class ValidateController < EventsController
    before_action :set_event, only: %i[ show index]


    def index    
        @events = Event.all
        @events_in_progress = Event.accepted.where('date >= ?', Date.today).limit(3)
        @events_proposed    = Event.proposed.where('date >= ?', Date.today).limit(3)
        @events_past        = Event.accepted.where('date <= ?', Date.today).limit(3)
      end
      
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

  when 'accepted' && Date.today >= @event.date
    @event.status = 'past'
    @event.save
    redirect_to '/events/', notice: "l'évenement a bien été accepté."
    end
  end


private

def set_event
    @event = Event.find(params[:id])
  end

def event_params
    params.require(:event).permit(:title, :date, :adress, :description, :image)

  end
end