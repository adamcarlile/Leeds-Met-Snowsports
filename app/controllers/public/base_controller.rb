class Public::BaseController < ApplicationController
  include AuthenticatedSystem

  layout 'public'
  helper :all
  
  before_filter :get_twitter_status
  
  private
  
  def get_twitter_status
    begin
      c = Grackle::Client.new
      @twitter = c.users.show? :id => 'lmsnowsports'
      @twitter_message = @twitter.status.text
    rescue Grackle::TwitterError
      @twitter_message = "Oops, looks like we had a problem"
    end
  end

end
