class NewsItem < Page
  
  can_have_children? false
  
  def self.latest
  	find(:all, :order => 'publish_date DESC', :limit => 3, :conditions => 'type = "NewsItem" and published = "1"')
  end

  def self.homepage
  	find(:all, :order => 'publish_date DESC', :limit => 2, :conditions => 'type = "NewsItem" and published = "1"')
  end
  
  def article_year
  	self.publish_date.year
  end
  
  def self.archives
  	find(:all, :order => 'publish_date DESC', :conditions => 'type = "NewsItem" and published = "1"')
  end

end