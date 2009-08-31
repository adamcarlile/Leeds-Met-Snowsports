class Admin::EventsController < Admin::BaseController
  setup_resource_controller

  def index
    @events = Event.all
  end
  
end