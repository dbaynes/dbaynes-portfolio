class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :configure_permitted_parameters, if: :devise_controller?
  # Rails 4.0.n work around for CanCan mass assignment. Resource here is project.
  
  before_filter do
    project = controller_name.singularize.to_sym
    method = "#{project}_params"
    params[project] &&= send(method) if respond_to?(method, true)
  end
  
  rescue_from CanCan::AccessDenied do |exception|
     redirect_to root_url, :alert => exception.message
  end
  
  protected
  def configure_permitted_parameters
     devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :password_confirmation, roles: [:author,:editor,:visitor]) }
  end
end
