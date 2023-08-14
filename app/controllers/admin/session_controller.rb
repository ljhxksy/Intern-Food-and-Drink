class Admin::SessionController < Admin::AdminController
    def create
        user = User.find_by(email: params[:email])
        if user && user.authenticate(params[:password]) && user.admin?
            session[:user_id] = user.id
            redirect_to(admin_home_path)
        else
            flash[:error] = "Invalid email or password"
            redirect_to(admin_root_path)
        end
    end
end