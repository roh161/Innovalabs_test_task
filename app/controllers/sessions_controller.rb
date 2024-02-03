class SessionsController < ApplicationController
    skip_before_action :verify_authenticity_token
  
    def login_api
      user = authenticate_user
  
      if user
        token = JwtService.encode({ user_id: user.id })
        render json: { message: 'Login successful', token: token }, status: :ok
      else
        render json: { error: 'Invalid email or password' }, status: :unauthorized
      end
    end
  
    def login_view
        user = authenticate_user
      
        if user
          session[:user_id] = user.id # Store user_id in session for future use
          redirect_to blogs_path, flash: { notice: 'Logged in successfully' }
        else
          redirect_to login_path, flash: { alert: 'Invalid email or password' }
        end
    end 

    def destroy
        session[:user_id] = nil
        redirect_to root_path, notice: 'Logged out successfully'
    end
  
    def new
      # Render the login form
    end
  
    private
  
    def authenticate_user
      User.find_by(email: params[:email])&.authenticate(params[:password])
    end
  end
  