class EventsController < ApplicationController
  expose :event, -> { Event.find_by_code(params[:code])}

  def show
    render json: event
  end
end
