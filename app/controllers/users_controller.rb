class UsersController < ApplicationController
    skip_before_action :verify_authenticity_token

    def sign_up_api
      user = User.new(user_params)
      if user.save
        render json: { message: 'User created successfully' }, status: :created
      else
        render json: { error: user.errors.full_messages }, status: :unprocessable_entity
      end
    end

    def new
        @user = User.new
    end
    
    def sign_up_view
        @user = User.new(user_params)
        if @user.save
          session[:user_id] = @user.id # Log in the user
          redirect_to blogs_path, notice: 'User created successfully.'
        else
          flash[:alert] = @user.errors.full_messages.join(', ')
          redirect_to signup_path
        end
    end
      
    private
  
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end

end
  