class RoleController < UsersController
    def index
        @users = User.all
      end


      def role
        @user = User.find(params[:id])
         role = @user.admin
         case role
     
       when 'false'
         @user.admin = 'true'
         @user.save
         redirect_to '/admin/users/', notice: "L'utilisateur est devenu admin."
       
       when 'true' 
         @user.admin = 'false'
         @user.save
        
         redirect_to '/admin/users', notice: "L'admin est devenu un utilisateur classique."
     
       end
     end 
  


end