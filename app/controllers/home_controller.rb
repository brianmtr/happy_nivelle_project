class HomeController < ApplicationController
  def index
    @events_in_progress = Event.where("status = ? or status = ?", 1,2).where("date >= ?", Date.today).limit(3)
    @events_proposed    = Event.proposed.where("date >= ?", Date.today).limit(3)
    @events_past        = Event.accepted.where('date < ?', Date.today).limit(3)
  end
end
