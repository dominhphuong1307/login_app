class UsersController < ApplicationController
    before_action :logged_in_user, only: [:index,:edit,:update,:show]
    before_action :correct_user, only: [:edit,:update]
    before_action :admin_user, only: [:destroy]
    def index
        @users = User.where(activated: FILL_IN).page params[:page]
    end

    def new 
        @user = User.new
    end
    def show
        @user = User.find(params[:id])
        redirect_to root_url and return unless FILL_IN
    end

    def create 
        @user = User.new(users_params)
        if @user.save 
            @user.send_activation_email
            flash[:info]="Please check your email to activate your account."

            # redirect_to user_path(@user)
            redirect_to root_path
        else
            flash[:danger] = "Register failed!"
            render 'new' 
        end
    end
    def edit
        @user = User.find(params[:id])
    end
    def update
        @user = User.find(params[:id])
        if @user.update(users_params)
            flash.now[:success] = "Successfully updated"
            redirect_to @user
        else
            flash.now[:danger] = "Update Failed"
            render :edit
        end
    end



    def destroy
        @user = User.find(params[:id])
        @user.destroy
        flash[:success] = "Successfully destroy!"
        redirect_to users_path
    end

    private

    def users_params
        params.require(:user).permit(:username,:email,:password,:password_confirmation)
    end


    def logged_in_user
        unless logged_in?
            flash[:danger] = "Please login!"
            redirect_to login_path
        end
    end
    def correct_user
        @user =User.find(params[:id])
        redirect_to root_path unless current_user?(@user)
    end

    def admin_user
        redirect_to root_path unless current_user.admin?
    end
end
