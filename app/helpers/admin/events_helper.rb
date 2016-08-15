module Admin::EventsHelper

  def has_role?
    event.is_secret || event.is_duplicate
  end
end
