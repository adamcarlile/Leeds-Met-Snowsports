class Twitter
  include HTTParty
  basic_auth 'frozenproduce', 'njh9x2'
  
  def self.twitter_feed
    get('http://www.twitter.com/statuses/user_timeline/lmsnowsports.json')
  end
  
end
