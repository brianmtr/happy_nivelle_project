class EventsController < ApplicationController
    before_action :set_event, only: %i[ show edit update participate]

    def index    
      @events = Event.all
      @events_in_progress = Event.accepted.where('date >= ?', Date.today).limit(3)
      @events_proposed    = Event.proposed.where('date >= ?', Date.today).limit(3)
      @events_past        = Event.past.where('date <= ?', Date.today).limit(3)
    end

 #GET /events/new
def new
  @event = Event.new
end
  
  def show; end
    #creation events for users
  def create
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: "Event was successfully created." }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end
    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: "Event was successfully created." }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

    # DELETE /events/1 or /events/1.json
    # def destroy
    #   @event.destroy
    #   respond_to do |format|
    #     format.html { redirect_to events_url, notice: "Event was successfully destroyed." }
    #     format.json { head :no_content }
    #   end
    # end

#   def validate
#     @event = Event.find(params[:id])
#     status = @event.status 
#     case status
# when nil
#     @event.status = 'proposed'
#     @event.save
#     redirect_to '/events/', notice: "l'évenement a bien été accepté."
  
#   when 'proposed' 
#     @event.status = 'accepted'
#     @event.save
#     if @event.status === 'accepted' && Date.today > @event.date 
#     @event.status = 'past'
#     @event.save
#     redirect_to '/events/', notice: "l'évenement a bien été accepté."
#     end
#   end





  private
  # Use callbacks to share common setup or constraints between actions.
  def set_event
    @event = Event.find(params[:id])
  end


  # Only allow a list of trusted parameters through.
  def event_params
    params.require(:event).permit(:title, :date, :adress, :description, :image, :participate)

  end


