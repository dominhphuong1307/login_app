class UsersController < ApplicationController
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
        
    end

    private

    def users_params
        params.require(:user).permit(:username,:email,:password,:password_confirmation)
    end
end
