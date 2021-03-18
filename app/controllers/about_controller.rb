class AboutController < ApplicationController
  def index
    @events             = Event.all
    @events_past        = Event.accepted.where('date < ?', Date.today).limit(3)
  end
end
