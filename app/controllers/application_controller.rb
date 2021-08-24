class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session

  before_action :configure_permitted_parameters, if: :devise_controller?
  
  
  #allowing a set of parameter for input in devise
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :password, :address, :contact,:role,:company_id])
  end
  

  #deciding the path after devise signin
  def after_sign_in_path_for(resource)
    if resource.class == Agent
      stored_location_for(resource) || "/display_prop"
    elsif resource.class == Renter
      stored_location_for(resource) || "/view_prop"
    else
      super
    end
  end

  def current_resource_owner
    Agent.find(doorkeeper_token.resource_owner_id) if doorkeeper_token
  end


end