class InvitationsController < Devise::InvitationsController
  before_filter :is_admin?, :only => [:new, :create]
  before_filter :configure_permitted_parameters, if: :devise_controller?
  
  def after_accept_path_for(resource)
    edit_user_registration_path
  end
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:invite) << [:role]
  end
end
