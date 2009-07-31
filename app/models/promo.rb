class Promo < ActiveRecord::Base
  include NamedScopeHelpers
  belongs_to :page
  
  named_scope :all, :order => 'position ASC'
  named_scope :top, :conditions => 'location = "top"', :order => 'position ASC', :limit => "5"
  named_scope :bottom, :conditions => 'location = "bottom"', :order => 'position ASC', :limit => "3"
  
  has_attached_file :image, 
    :url =>                   "/upload/images/:id/:style_:basename.:extension",
    :path => ":rails_root/public/upload/images/:id/:style_:basename.:extension",
    :styles => {
        :medium => "300x160#",
        :thumbnail => "75x75#",
        :main_promo => "629x353#"
    }
      
  validates_attachment_presence :image, :message => 'not uploaded'
  validates_attachment_content_type :image, :content_type => ['image/jpeg', 'image/gif', 'image/png']
  validates_presence_of :title
  validates_presence_of :intro
  validates_presence_of :location
  
end
