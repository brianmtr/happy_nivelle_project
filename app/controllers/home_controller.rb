class HomeController < ApplicationController

  def index
    @events = Event.all
    @events_in_progress = Event.accepted.where('date >= ?', Date.today).limit(3)
    @events_proposed    = Event.proposed.where('date >= ?', Date.today).limit(3)
    @events_past        = Event.past.where('date <= ?', Date.today).limit(3)
  end
end
