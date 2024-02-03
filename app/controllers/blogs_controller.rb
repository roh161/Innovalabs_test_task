class BlogsController < ApplicationController
    before_action :authenticate_user, only: :index
    before_action :authenticate_blog_list_api, only: :blog_list
  
    def blog_list
      blogs = Blog.all
      render json: blogs, status: :ok
    end
  
    def index
      @blogs = Blog.all
    end
  
    private
  
    def authenticate_user
        unless current_user
          redirect_to login_path, alert: 'Please log in to view blog list page'
        end
    end

    def authenticate_blog_list_api
        token = request.headers['token']
        if token.present?
          decoded_token = JwtService.decode(token)
          if decoded_token && user = User.find_by(id: decoded_token['user_id'])
            return true
          end
        end
        render json: { error: 'Login First' }, status: :unauthorized
        return false
    end
end
  