require 'koala'
require 'hashugar'
require 'facebook/local_cache'

module Facebook
  extend self

  def config
    @config ||= (YAML.load_file(File.join(RAILS_ROOT, 'config', 'facebook.yml'))[RAILS_ENV]).to_hashugar
  end

  def connection
    return @connection unless @connection.nil?
    token = Koala::Facebook::OAuth.new(config.app_id, config.app_secret, nil).get_app_access_token
    puts token
    @connection = Koala::Facebook::GraphAPI.new(token)
  end

  def cache
    @cache ||= Facebook::LocalCache.new()
  end

  def get_object(*args)
    connection.get_object(*args).to_hashugar
  end

  def get_connections(*args)
    connection.get_connections(*args).to_hashugar
  end

end
