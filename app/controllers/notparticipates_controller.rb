class NotparticipatesController < EventsController

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

    def notparticipate
        @event = Event.find(params[:id])
        @event.increment!(:not_participate)
        @event.save
        redirect_to event_path
    end
end
