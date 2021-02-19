class RoleController < Admin::UsersController
    def index
        @users = User.all
      end

def role
   @user = User.find(params[:id])
    if user.admin === 'false'
        user.admin === 'true'
    elsif user.admin === 'true'
        user.admin === 'false'
    end
   
    redirect_to 'admin/users/', notice: "l'évenement a bien été casse couille."

  end
  
  private

  def user_params
    params.require(:user).permit(:admin)
end
end