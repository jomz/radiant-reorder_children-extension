module ReorderChildren
  module PageHelperExtensions
    def page_icon(page)
      icon_name = page.virtual? ? 'virtual_page' : 'page'
      image(icon_name, :class => "icon", :alt => '', :title => '')
    end
  end
end