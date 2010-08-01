class Admin::GalleriesController < Admin::BaseController
  setup_resource_controller
  
  def index
    @collection = Gallery.all
  end

  def reorder
    puts params.inspect
    params[:gallery].each_with_index do |item_id,index|
      if(Gallery.exists?(item_id))
        Gallery.find(item_id).update_attribute(:position, index+1)
      end
    end
    render :nothing => true
  end
  
end
