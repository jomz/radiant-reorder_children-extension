begin
   require_dependency 'application_controller'
rescue MissingSourceFile
   require_dependency 'application'
end

require 'radiant-reorder_children-extension/version'
class ReorderChildrenExtension < Radiant::Extension
  version RadiantReorderChildrenExtension::VERSION
  description "Adds the ability to reorder the children of a page."
  url "http://github.com/jomz/radiant-reorder_children-extension"

  migrate_from "Reorder", 1
  # extension_config do |config|
  #   config.gem 'some-awesome-gem'
  #   config.after_initialize do
  #     run_something
  #   end
  # end
  
  def activate
    admin.page.index.add :sitemap_head, 'reorder_extra_th', :after => "modify_column_header"
    admin.page.index.add :node, 'reorder_extra_td', :after => "add_child_column"
    
    Page.send :include, ReorderChildren::PageExtensions, ReorderChildren::RadiusTags
    Page.reflections[:children].options[:order] = "position ASC"
    
    StandardTags.class_eval do
      unless method_defined?(:children_find_options_with_position)
        def children_find_options_with_position(tag)
          default_options = children_find_options_without_position(tag)
          default_options[:order].sub! /published_at/, 'position' if tag.attr.symbolize_keys[:by].nil?
          default_options
        end
        alias_method_chain :children_find_options, :position
      end
    end
    
    Admin::PagesController.send :include, ReorderChildren::PagesControllerExtensions
    Admin::PagesController.send :helper, ReorderChildren::PageHelperExtensions
  end
end
