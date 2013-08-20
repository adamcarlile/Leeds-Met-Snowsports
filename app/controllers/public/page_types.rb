#
# Actions for each page behaviour behaviour
#
module Public::PageTypes

  def redirect
    redirect_to @page.url
  end

  def homepage
    @promos_bottom = Promo.bottom
    @random_images = GalleryImage.all(:order => 'RAND()', :limit => 6)
    @promos_top = Promo.top
    @news = NewsItem.homepage
    @event = Facebook.get_object(@events.first[:id]) unless @events.blank?
    render(:template => 'public/page_types/homepage', :layout => 'layouts/homepage') and @rendered = true
  end

  def news_index
    @news = Page.paginate(:page => params[:page], :conditions => 'type = "NewsItem"', :order => 'publish_date DESC', :per_page => 10)
    respond_to do |format|
      format.html { render_page_type }
      format.rss { render(:template => 'public/page_types/news_index.rss.builder', :layout => false) } and @rendered = true
    end
  end

  def news_item
    @news_item = @page
  end

  def contact_form
    if params[:sent] == '1'
      render_page_type(@page.public_template + '_sent')
    else
      @enquiry = Enquiry.new(:source => @page.title)
      if request.post?
        @rendered = true
        @enquiry.attributes = params[:enquiry]
        if @enquiry.save && verify_recaptcha(@enquiry)
          SiteMailer.deliver_enquiry(@enquiry)
#          SiteMailer.deliver_confirmation(@enquiry)

          if @enquiry.newsletter == true
            uri = URI.parse('http://bluestormnewmedia.createsend.com/t/1/s/nijx/')
            Net::HTTP.post_form(uri, {
               'mb-name' => @enquiry.name,
               'mb-nijx-nijx' => @enquiry.email
             })
          end

          redirect_to view_page_url(:slug_path => @page.to_param, :sent => 1) and return

        else
          flash.now[:error] = 'Please check the details you provided'
        end
      end
      render_page_type
    end
  end


  def site_search
    #@results = Page.paginate_search(params[:q], :page => params[:page], :per_page => 10)
    @results = Ultrasphinx::Search.new(:query => params[:q])
    @results.run
    @results.results
    render_page_type
  end

  def paginated_index
    @pager = make_pager(@page.children.published_count,10)
    @sub_pages = @page.children.published(:pager => @pager)
  end

  def download_list
    @downloads = @page.children.published(:page => params[:page])
  end

  def gallery_list
    if params[:id]
      @galleries = Gallery.all
      @gallery = Gallery.find(params[:id])
      @page_title = "#{@gallery.name}"
      render :template => '/public/page_types/gallery' and @rendered = true
    else
      @galleries = Gallery.all
    end
  end

  def link_list
    @links = @page.visible_children(:page => params[:page], :order => "title DESC", :per_page => 10)
  end

  def gallery
    @gallery = @page
  end

  def view_event
    if params[:id]
      @root_page = Page.find_by_slug('events')
      @event = Facebook.get_object(params[:id])
      @page_title = @event.title
      render :template => '/public/events/show' and @rendered = true
    else
      @page = Page.find_by_slug('events')
      @page_title = @page.title
      @root_page = @page
      render :template => '/public/page_types/events_index' and @rendered = true
    end
  end

  def view_gallery
    @galleries = Gallery.all
    @page = Page.find_by_slug('gallery')
    if params[:id]
      @gallery = Gallery.find(params[:id])
      @page_title = "#{@gallery.name}"
      render :template => '/public/page_types/gallery' and @rendered = true
    else
      @page_title = @page.title
      render :template => '/public/page_types/gallery_list' and @rendered = true
    end
  end

end
