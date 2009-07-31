class Admin::PromosController < Admin::BaseController
  setup_resource_controller
  before_filter :get_pages
  
  def index
    @promos = Promo.all
  end
  
  def reorder
    @promos = Promo.all
    @page_title = "Reordering items for Promos"
    render :action => 'shared_reorder'
  end

  def reorder_form
    puts params.inspect
    params[:item].each_with_index do |item_id,index|
      if(Promo.exists?(item_id))
        Promo.find(item_id).update_attribute(:position, index+1)
      end
    end
    render :nothing => true
  end
  
  private
  
  def get_pages
    @page = Page.all
  end

end