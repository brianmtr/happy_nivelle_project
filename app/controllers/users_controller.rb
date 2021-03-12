class UsersController < ApplicationController


  # GET /events/1 or /events/1.json
  def show
    @events = Event.all
    @user = current_user
  end



  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:firstname, :lastname, :email, :admin)
  end
end
