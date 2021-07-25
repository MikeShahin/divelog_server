class SessionsController < ApplicationController

  
    def create
      @user = User.find_by(email: params[:email])
      if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id
        token = generate_token({id: @user.id})
        resp = {
          user: @user.user_serializer,
          jwt: token
        }
        render json: resp, status: :ok
      else
        resp = {
          error: "Sorry, username/password incorrect",
          details: @user.errors.full_messages
        }
        render json: resp, status: :unauthorized
      end
    end
  
    def get_current_user
      if logged_in?
        render json: {
            user: user_serializer(current_user)
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