class SessionsController < ApplicationController
    skip_before_action :verify_authenticity_token, only: [:create]
    def new
    end
    def create
        @user = User.find_by(email: params[:session][:email])
        if @user && @user.authenticate(params[:session][:password])
            flash[:success] = "Login Success!"
            # Save data user in session

            log_in @user
            params[:session][:remember_me] =='1'? remember(@user): forget(@user)
            # render json: {status: 200, msg: "Succsses Login !"}

            redirect_to root_path
        else
            flash[:danger] = "Login Failed!"
            render 'new' 
        end
    end
    def destroy
        # logout user
        log_out
        flash[:success] = "Log out success"
        redirect_to login_path
    end
end
