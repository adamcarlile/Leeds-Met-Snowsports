require 'rack/utils'

class FlashSessionCookieMiddleware
  def initialize(app, session_key = '_cms_session')
    @app = app
    @session_key = session_key
  end

  def call(env)
    if env['HTTP_USER_AGENT'] =~ /^(Adobe|Shockwave) Flash/
      params = ::Rack::Utils.parse_query(env['QUERY_STRING'])
      env['HTTP_COOKIE'] = [ @session_key, params["_cms_session"] ].join('=').freeze unless params["_cms_session"].nil?
    end
    @app.call(env)
  end
end
