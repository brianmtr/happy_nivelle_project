class AdminController < ApplicationController
    before_action :authorized?
    
    layout 'administration'
    
    # def index
    #     @events = Event.all
    #     @comments = Comment.all
    # end


    private


    def authorized?
      unless current_user.admin?
        flash[:error] = "You are not authorized to view that page."
        redirect_to root_path
      end
    end
    
end
