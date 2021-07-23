require 'pry'
class ApplicationController < ActionController::API
    def current_user
      begin
        @current_user ||= User.find(decode_token_and_get_user_id)
      rescue
        return nil
      end
    end

    def generate_token(payload)
      JWT.encode(payload, ENV['JWT_TOKEN_SECRET'])
    end
  
    def decode_token_and_get_user_id
      JWT.decode(request.headers["Authorization"], ENV['JWT_TOKEN_SECRET'])[0]["id"]
    end

    def encode_token(payload)
      # should store secret in env variable
      JWT.encode(payload, 'my_s3cr3t')
    end
  
    def auth_header
      request.headers['Authorization']
    end
  
    def decoded_token
      if auth_header
        token = auth_header.split(' ')[1]
        begin
          JWT.decode(token, 'my_s3cr3t', true, algorithm: 'HS256')
        rescue JWT::DecodeError
          nil
        end
      end
    end
  
    def logged_in?
      !!current_user
    end
  
    def authorized
      render json: { message: 'Please log in' }, status: :unauthorized unless logged_in?
    end
end
