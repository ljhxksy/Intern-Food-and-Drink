class Admin::UsersController < Admin::AdminController
    def index
        @users = User.user
    end

    def show
        @user = User.find(params[:id])
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
            flash[:success] = "Profile updated"
            redirect_to admin_users_path
        else
            render 'edit', status: :unprocessable_entity
        end
    end

    private
        def user_params
            params.require(:user).permit(:username, :email, :password, :password_confirmation)
        end
end