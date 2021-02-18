class HomeController < ApplicationController

  def index
    @events = Event.all
    @users = User.all
    @comments = Comment.all
  end

  def accepted
    @home = Home.find(params[:id])
    @home.accepted = true
    @home.save
    redirect_to '/homes', notice: "l'évenement a bien été accepté."
  end

end
