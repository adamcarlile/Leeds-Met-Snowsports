require 'digest/sha1'

class User < ActiveRecord::Base

  acts_as_authentic
  
  attr_protected :admin
  
  has_attached_file :avatar, 
    :url =>                   "/upload/images/avatars/:id/:style_:basename.:extension",
    :path => ":rails_root/public/upload/images/avatars/:id/:style_:basename.:extension",
    :default_url => "/defaults/avatars/missing_:style.jpg",
    :styles => {
        :small => "50x50#",
        :thumbnail => "75x75#",
        :large => "640x480>"
    }
    
  
  validates_attachment_content_type :avatar, :content_type => ['image/jpeg', 'image/gif', 'image/png']


	def to_s
		name
	end

  def name
    "#{firstname} #{lastname}"
  end

end