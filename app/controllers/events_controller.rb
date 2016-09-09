class EventsController < ApplicationController
  expose :event, -> { Event.find_by_code(params[:code])}

  def show
    # render json: event
  end

  def voting
    result = {success: false}
    if (event.is_multi_select and params[:items].present?) or (!event.is_multi_select and params[:item].present?)
      vote_result = event.voted(current_user, params)
      result = vote_result
    end
    render json: result
  end

  def voted
  end
end
