module AjaxHelper
  
  def user_auth_status(resource, action)
    current_user && current_user.has_permission?(resource, action) ? 'access_allowed' : 'access_denied'
  end
  
  def ajax_update_path(model_class, id, options = {})
    options.merge!({ :model => model_class, :id => id })
    ajax_action_path(:update, options)
  end
  
  def ajax_action_path(action, options = {})
    hash = { :controller => 'ajax', :action => action }
    hash.merge! options
    url_for(hash)
  end
  
end
