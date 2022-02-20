class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  def after_sign_in_path_for(*)
    if current_user.admin?
      homes_path
    else
      dramas_path
    end
  end

  def after_sign_out_path_for(*)
    dramas_path
  end
end
