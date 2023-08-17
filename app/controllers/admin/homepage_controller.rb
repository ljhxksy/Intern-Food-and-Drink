class Admin::HomepageController < Admin::AdminController
    skip_before_action :check_admin_login, only: [:login]
    def login
        redirect_to admin_home_path if admin_logged_in?
    end

    def home; end
end
