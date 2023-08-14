class Admin::HomepageController < Admin::AdminController
    def login
        redirect_to admin_home_path
    end

    def home; end
end
