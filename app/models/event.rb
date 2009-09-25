class Event < ActiveRecord::Base
  include NamedScopeHelpers
  
  has_attached_file :image, 
    :url =>                   "/upload/events/:id/:style_:basename.:extension",
    :path => ":rails_root/public/upload/events/:id/:style_:basename.:extension",
    :styles => {
        :medium => "300x160#",
        :thumbnail => "75x75#",
        :main_promo => "629x353#"
    }
    validates_attachment_presence :image, :message => 'not uploaded'
    validates_attachment_content_type :image, :content_type => ['image/jpeg', 'image/gif', 'image/png']
    
  def address
    [street, town, county, post_code].join(' ')
  end    
  
    
end