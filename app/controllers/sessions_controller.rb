# require 'pry'
class SessionsController < ApplicationController
    def create
      @user = User.find_by(email: params[:user][:email])
  
      if @user && @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        resp = {
          user: @user.user_serializer
        }
        render json: resp, status: :ok
      else
        resp = {
          error: "Sorry, user name/password incorrect",
          details: @user.errors.full_messages
        }
        render json: resp, status: :unauthorized
      end
    end
  
    def get_current_user
      # binding.pry
      if logged_in?
        render json: {
            user: current_user.user_serializer
          }, status: :ok
      else
        render json: {error: "Not logged in"}
      end
    end
  
    def destroy
      if session.clear
  
        render json: {
          message: "logged out"
        }, status: :ok
      else
        render json: {
          error: "Oopsie Doopsie!"
        }, status: 500
      end
    end
  end