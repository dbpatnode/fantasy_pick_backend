class UsersController < ApplicationController
  skip_before_action :authorized, only: [:create]

  def profile
    render json: { user: UserSerializer.new(current_user) }, status: :accepted
  end

  def index
    @users = User.all
    render json: @users
  end

  def show
    @user = User.find_by(id: params[:id])
    if @user
      render json: @user
    else
      render json: { message: 'This ID does not exist' }
    end
  end

  def create
    
    @user = User.create(user_params)
    if @user.valid?
      @token = encode_token({ user_id: @user.id })
      render json: { user: UserSerializer.new(@user), token: @token }, status: :created
    else
      
      render json: { error: @user.errors.full_messages }, status: :not_acceptable
    end
  end

  def login
    @user = User.find_by(username: params[:username])
    if @user&.authenticate(params[:password])
      token = encode_token({ user_id: @user.id })
      render json: { user: UserSerializer.new(@user), token: token }
    else
      render json: { error: 'wrong user or password' }
    end
end

  def update
    @user = User.find_by(id: params[:id])
    @user.update_attributes(user_params)
    if @user.save(validate: false)
      render json: @user
    else
      render json: { error: @user.errors.full_messages}
    end
  end

  def destroy
    @user = User.find_by(id: params[:id])
    @user.destroy

    render json: { message: 'deleted' }
  end

  def persist
    token = encode_token({ user_id: @user.id })
    render json: { user: UserSerializer.new(@user), token: token }
  end

    private
  
    def user_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation, :wins, :losses, :team_id)
    end
end
  