class ParticipatesController < EventsController
before_action :set_event, only: [:show, :edit, :update, :destroy, :participate, :maybe_participate, :not_participate]


  # PATCH/PUT /events/1 or /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: "Event was successfully updated." }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

    def participate
        @event = Event.find(params[:id])
        @event.increment!(:participate)
        @event.save
        redirect_to event_path, notice: "merci pour votre particpation"
    end




    private
  # Use callbacks to share common setup or constraints between actions.
  def set_event
    @event = Event.find(params[:id])
  end


  # Only allow a list of trusted parameters through.
  def params_event
    params.require(:event).permit(:title, :date, :adress, :description, :image, :participate)

  end
end