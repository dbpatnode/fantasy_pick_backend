class AuthController < ApplicationController
    
    skip_before_action :authorize_action, except: [:show]
    
    def create
        # byebug
        @user = User.find_by(username: user_params[:username])
        render json: { error: "No User found with that username." }, status: 404 if !@user
        if !@user.authenticate(user_params[:password])
        render json: { error: "Password invalid." }, status: 401
        end
        auth_token = self.issue_token(@user)
        render json: { auth_token: auth_token, user: UserSerializer.new(@user) }
    end

    def show
        @user = User.find(@request_user_id)
        render json: @user
    end

    def issue_token(user)
        JWT.encode({ user_id: user.id}, ENV['SECRET'], ENV['ALG'])
    end
    
    def user_params
        params.require(:user).permit(:username, :password)
    end

end