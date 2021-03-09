class HomeController < ApplicationController
  def index
    @events_in_progress = Event.accepted.where("date >= ?", Date.today).limit(3)
    @events_proposed    = Event.proposed.where("date >= ?", Date.today).limit(3)
    @events_past        = Event.past.where('date < ?', Date.today).limit(3)
    if Event.accepted.where('date < ?', Date.today).update(status: 'past')
    end
  end
end
