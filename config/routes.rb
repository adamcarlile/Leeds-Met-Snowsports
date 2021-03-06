ActionController::Routing::Routes.draw do |map|

  # Users
  map.resources :user_sessions
  map.resources :users
  map.resource :account, :controller => "users"
  map.logout '/logout', :controller => 'user_sessions', :action => 'destroy'
  map.login '/login', :controller => 'user_sessions', :action => 'new'
  

  # Admin Routes
  map.namespace(:admin) do |admin|
    admin.resources :pages, :collection => {
      :children => :get, :reorder_children => :get, :reorder => :post, 
      :add_file_upload => :post, :delete_file_upload => :post, 
      :add_image => :post, :delete_image => :post, :reorder_images => :post
      }
    admin.resources :promos, :collection => {:reorder => :get, :reorder_form => :post}
    admin.resources :images, :member => {:crop_settings => :get}
    admin.resources :file_uploads
    admin.resources :file_upload_categories
    admin.resources :snippets
    admin.resources :users
    admin.resources :events
    admin.resource :session
    admin.resources :members, :member => { :suspend => :put, :unsuspend => :put }
    admin.resources :galleries, :collection => { :reorder => :post } do |image|
      image.resources :gallery_images, :collection => {:reorder => :post}
    end
  end
  map.admin_dashboard 'admin', :controller => 'admin/pages', :action => 'index'
  map.flex_crop '/admin/images/:id/crop.xml', :controller => 'admin/images', :action => 'flex_crop'


  # All other pages
  map.with_options(:controller => 'public/pages') do |m|
    m.event        '/events/:id',             :action => 'view_event'
    m.gallery      '/gallery/:id',            :action => 'view_gallery'
    m.homepage     '',                        :action => 'view', :slug_path => 'home'
    m.view_page    '*slug_path.:format',      :action => 'view'
    m.view_page    '*slug_path',              :action => 'view'
  end

end
