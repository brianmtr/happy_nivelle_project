class Admin::RoleController < Admin::UsersController
    # def index
    #     @users = User.all
    #   end

  def update
    @user = User.find(params[:id])
    role = @user.admin
    case role

    when "false"
      @user.admin = "true"

      @user.save
      redirect_to "/admin/users/", notice: "L'utilisateur classique est devenu admin."
    when "true"
      @user.admin = "false"

      @user.save

      redirect_to "/admin/users", notice: "L'admin est devenu un utilisateur classique."
    end
  end
end
