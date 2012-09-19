class Public::BaseController < ApplicationController
  include AuthenticatedSystem

  layout 'public'
  helper :all

  before_filter :get_twitter_status, :get_facebook_events

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

  def get_facebook_events
    @events = Facebook.get_connections('leedsmetsnowsports', 'events').reverse.reject {|x| x.end_time.to_time < Time.now}
  end

end
