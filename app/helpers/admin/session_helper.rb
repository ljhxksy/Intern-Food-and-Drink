module Admin::SessionHelper
    def current_admin
        if session[:user_id]
            @current_user ||= User.find_by(id: session[:user_id])
            @current_user.admin? ? @current_user : nil 
        end
    end

    def admin_logged_in?
        !current_admin.nil?
    end

    def admin_log_out
        session.delete(:user_id)
        @current_user = nil
    end
end
