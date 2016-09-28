class EventsController < ApplicationController
  expose :event, -> { Event.find_by_code(params[:code])}

  def show
    # render json: event
  end

  def voted
    result = {success: false}

    if event.is_secret and !user_signed_in?
      result = {success: false, message: I18n.t('votes.errors.event_need_singin')}
    elsif (event.is_multi_select and params[:items].present?) or (!event.is_multi_select and params[:item].present?)
      vote_result = event.voted(current_user, params)
      result = vote_result
    else
      result = {success: false, message: I18n.t('votes.errors.event_blank')}
    end
    render json: result
  end
end
