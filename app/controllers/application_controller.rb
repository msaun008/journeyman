class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception


    def authenticate_user!(options={})
      if user_signed_in?
        super
      else
        redirect_to new_user_session_path
      end
    end

    def after_sign_in_path_for(resource)
      dashboard_path
    end

    def verify_is_admin
      if !current_user.admin?
        redirect_to dashboard_path, alert: "1003 - Must be admin to access this page."
      end
    end
end
