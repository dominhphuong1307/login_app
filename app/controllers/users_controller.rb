class UsersController < ApplicationController
    before_action :logged_in_user, only: [:index,:edit,:update,:show]
    before_action :correct_user, only: [:edit,:update]
    before_action :is_admin?, only: [:edit]
    def index
        @users = User.page params[:page]
    end

    def new 
        @user = User.new
    end

    def show
        @user = User.find(params[:id])
    end

    def create 
        @user = User.new(users_params)
        if @user.save 
            flash[:success]= "Register success!"
            # redirect_to user_path(@user)
            redirect_to login_path
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
end
