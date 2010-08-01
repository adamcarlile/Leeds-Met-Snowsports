class Admin::GalleryImagesController < Admin::BaseController
  skip_before_filter :verify_authenticity_token 
  
  setup_resource_controller
  
  belongs_to :gallery
  
  create do
    flash "Image successfully uploaded!"
    wants.html do
      if @object.save
        redirect_to collection_url
      else
        render :action => :new
      end
    end
    wants.json do
      if @object.save
        render :json => { :result => 'success', :asset => @object.id }
      else
        render :json => { :result => 'error', :error => @object.errors.full_messages.to_sentence }
      end
    end
  end

  def reorder
    puts params.inspect
    params[:gallery_image].each_with_index do |item_id,index|
      if(GalleryImage.exists?(item_id))
        GalleryImage.find(item_id).update_attribute(:position, index+1)
      end
    end
    render :nothing => true
  end
  
end