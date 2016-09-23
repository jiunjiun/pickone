class Admin::EventsController < AdminController
  expose :events, -> { current_user.events }
  expose :event
  expose :items, -> { event.items }

  def index
  end

  def show
    gon.is_show = true
  end

  def new
  end

  def create
    event.user = current_user
    if event.save
      redirect_to admin_event_path(event)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if event.update(event_params)
      redirect_to admin_event_path(event)
    else
      render :edit
    end
  end

  def destroy
    event.destroy
    redirect_to events_path
  end

  private
  def event_params
    params.require(:event).permit(
      :title, :desc, :is_secret, :is_multi_select,
      items_attributes: [:id, :name, :link, :_destroy]
    )
  end
end
