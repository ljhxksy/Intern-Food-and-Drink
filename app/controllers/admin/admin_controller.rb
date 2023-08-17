class Admin::AdminController < ApplicationController
    include Admin::SessionHelper
    before_action :check_admin_login


    
    private

    def check_admin_login
        redirect_to admin_root_path unless admin_logged_in?
    end
end
