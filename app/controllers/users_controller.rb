class UsersController < ApplicationController
    before_action :set_user, only: [:show, :update, :destroy]
  
    def index
      @users = User.all
      render json: @users
    end
  
    def show
      @user = User.find_by(id: params[:id])
      if @user
        # binding.pry
          render json: @user.dives
      else 
          render json: {error: "User doesn't exist"}
      end
    end
  
    def create
      @user = User.new(user_params)
      if @user.save
        render json: @user, status: :created, location: @user
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    end
  
    private
      
      def set_user
        @user = User.find(params[:id])
      end
  
      def user_params
        params.require(:user).permit(:username, :email, :password)
      end

  end