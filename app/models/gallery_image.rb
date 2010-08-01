class GalleryImage < ActiveRecord::Base
  belongs_to :gallery
  
  default_scope :order => :position
  
  acts_as_list :scope => :gallery
  
  has_attached_file :file, 
    :url =>                   "/upload/gallery/:id/:style_:basename.:extension",
    :path => ":rails_root/public/upload/gallery/:id/:style_:basename.:extension",
    :styles => { 
      :thumb => "164x121#", 
      :medium => "640x480",
      :large => "800x600",
      :xlarge => "1024x768"
    }

end
