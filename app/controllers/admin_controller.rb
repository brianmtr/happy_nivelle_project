class AdminController < ApplicationController
    before_action :authorized?
    
    def index
        @events = Event.all
    end


    private


    def authorized?
      unless current_user.admin?
        flash[:error] = "You are not authorized to view that page."
        redirect_to root_path
      end
    end
    
end
