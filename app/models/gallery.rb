class Gallery < ActiveRecord::Base
  has_many :gallery_images
  has_many :pages
  acts_as_list
  
  default_scope :order => :position
    
  def to_param
    "#{id}-#{name.parameterize}"
  end
  
end
