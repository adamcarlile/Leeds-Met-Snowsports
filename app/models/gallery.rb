class Gallery < ActiveRecord::Base
  has_many :gallery_images
  acts_as_list
  
  default_scope :order => :position
    
  def to_param
    "#{id}-#{name.parameterize}"
  end
  
end
