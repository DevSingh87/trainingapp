class ApplicationController < ActionController::Base
  protect_from_forgery

  layout :layout_by_resource

  def layout_by_resource
    if devise_controller? && resource_name == :user && action_name == 'sign_in'
      "devise"
    else
      "application"
    end
  end
  
  def after_sign_in_path_for(resource)
    request.env['omniauth.origin'] || stored_location_for(resource) || admin_tutorials_path
  end
  
  def after_sign_out_path_for(resource)
    root_path
  end
  
end
