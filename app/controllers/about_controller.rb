class AboutController < ApplicationController
  def index
    @events = Event.all
    @events_past        = Event.past
  end
end
