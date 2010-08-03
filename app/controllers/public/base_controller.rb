class Public::BaseController < ApplicationController
  include AuthenticatedSystem

  layout 'public'
  helper :all
  
  before_filter :get_twitter_status
  
  private
  
  def get_twitter_status
    c = Grackle::Client.new
    @twitter = c.users.show? :id => 'lmsnowsports'
  end

end
