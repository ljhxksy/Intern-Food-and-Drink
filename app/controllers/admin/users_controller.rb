class Admin::UsersController < Admin::AdminController
    before_action :find_user, only: [:show, :edit, :update, :destroy]
    def index
        @users = User.user
    end

    def show
    end

    def edit
    end

    def update
        if @user.update(user_params)
            flash[:success] = "Profile updated"
            redirect_to admin_users_path
        else
            render 'edit', status: :unprocessable_entity
        end
    end

    def destroy
        if @user.destroy
            flash[:success] = "User deleted"
            redirect_to admin_users_path, status: :see_other
        else
            redirect_to request.referrer, status: :see_other
        end
    end

    private

        def find_user
            @user = User.find(params[:id])
        end

        def user_params
            params.require(:user).permit(:username, :email, :password, :password_confirmation)
        end
end
