ActionController::Routing::Routes.draw do |map|
  map.page_reorder_children  'admin/pages/reorder/:id', :controller => 'admin/pages', :action => 'reorder'
end