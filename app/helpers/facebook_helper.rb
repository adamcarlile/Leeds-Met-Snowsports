module FacebookHelper
  
  # Remember to include xmlns:fb="http://www.facebook.com/2008/fbml in the XML namespace declaration iside the <html> element
  
  def include_facebook_javascript(app_id, options={})
    default_options = {
      :status => true,
      :cookie => true,
      :xfbml => true,
      :channel_url => "#{homepage_url}channel.html",
      :oauth => true
    }
    options = default_options.update(options)
    html = []
    html << render_facebook_root_element
    html << render_facebook_script_tag
    html << render_fb_init(app_id, options)
    html.join("\n")
  end
  
  private
  
    def render_facebook_script_tag
      javascript_include_tag('http://connect.facebook.net/en_US/all.js')
    end
    
    def render_facebook_root_element
      content_tag(:div, '', :id => 'fb-root')
    end
    
    def render_fb_init(app_id, options)
      javascript_tag do
        <<-eos
          FB.init({
            appId  : '#{app_id}',
            status : #{options[:status]}, // check login status
            cookie : #{options[:cookie]}, // enable cookies to allow the server to access the session
            xfbml  : #{options[:xfbml]}, // parse XFBML
            channelURL : '#{options[:channel_url]}', // channel.html file
            oauth  : #{options[:oauth]} // enable OAuth 2.0
          });
        eos
      end
    end
  
end