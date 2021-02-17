class AdminController < ApplicationController
    def index
        @events = Event.all
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
        if @event.status === 'accepted' && Date.today > @event.date 
        @event.status = 'past'
        @event.save
        redirect_to '/events/', notice: "l'évenement a bien été accepté."
        end
      end
    end
    
end
