module Admin::PromosHelper
  
  def page_options(selected_value = nil, sections = Page.top_level, depth = 0)
    options = ''
    sections.each do |section|
      if section.can_have_children?
        padding = " - " * depth
        option_options = {:value => section.id}
        if section.id == selected_value
          option_options[:selected] = 'selected'
        end
        options << content_tag('option', padding + section.title, option_options)
        if section.children_count > 0 and !section.archive?
          options << page_options(selected_value, section.children, depth + 1)
        end
      end
    end
    options
  end
  
end
