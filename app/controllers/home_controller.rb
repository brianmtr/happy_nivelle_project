class HomeController < ApplicationController

  def index
    @events = Event.all
    @events_in_progress = Event.accepted.where('date >= ?', Date.today).limit(3)
    @events_proposed    = Event.proposed.where('date >= ?', Date.today).limit(3)
    @events_past        = Event.accepted.where('date <= ?', Date.today).limit(3)
  end

  def accepted
    @home = Home.find(params[:id])
    @home.accepted = true
    @home.save
    redirect_to '/homes', notice: "l'évenement a bien été accepté."
  end

end
