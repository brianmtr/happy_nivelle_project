class EventsController < ApplicationController
  before_action :set_event, only: %i[ show edit update destroy ]

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
  
  def show
      @user_events = UserEvent.where(event_id: params[:id]) 
      @vote_participated = @user_events.yes.count
      @vote_not_participated = @user_events.no.count
      @vote_maybe_participated = @user_events.maybe.count
   end
    #creation events for users
  def create
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: "Bravo votre événement est en attente de validation par l'admin !" }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end


# DELETE /events/1 or /events/1.json
def destroy
  @event.destroy
  respond_to do |format|
    format.html { redirect_to events_url, notice: "L'événement a été detruit avec succès !" }
    format.json { head :no_content }
  end
end


  # PATCH/PUT /events/1 or /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: "L'événement a été mis à jour." }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

private

# Use callbacks to share common setup or constraints between actions.
def set_event
  @event = Event.find(params[:id])
end

# Only allow a list of trusted parameters through.
def event_params
  params.require(:event).permit(:title, :date, :address, :description, :image, :participate)
end

end