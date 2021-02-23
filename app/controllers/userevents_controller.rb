class UsereventsController < ApplicationController
  before_action :set_userevent, only: %i[ show edit update destroy ]

  # GET /userevents or /userevents.json
  def index
    @userevents         = Userevent.all
    # @userevents_in_yes  = Userevent.yes.where(event.participate)
    # @userevents_maybe   = Userevent.maybe.where(state)
    # @userevents_no      = Userevent.no.where(state)
  end

  # GET /userevents/1 or /userevents/1.json
  def show
  end

  # GET /userevents/new
  def new
    @userevent = Userevent.new
  end

  # GET /userevents/1/edit
  def edit
  end

  # POST /userevents or /userevents.json
  def create
    @userevent = Userevent.new(userevent_params)

    respond_to do |format|
      if @userevent.save
        format.html { redirect_to @userevent, notice: "Userevent was successfully created." }
        format.json { render :show, status: :created, location: @userevent }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @userevent.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /userevents/1 or /userevents/1.json
  def update
    respond_to do |format|
      if @userevent.update(userevent_params)
        format.html { redirect_to @userevent, notice: "Userevent was successfully updated." }
        format.json { render :show, status: :ok, location: @userevent }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @userevent.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /userevents/1 or /userevents/1.json
  def destroy
    @userevent.destroy
    respond_to do |format|
      format.html { redirect_to userevents_url, notice: "Userevent was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_userevent
      @userevent = Userevent.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def userevent_params
      params.fetch(:userevent, {})
    end
end
