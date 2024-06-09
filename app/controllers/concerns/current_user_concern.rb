# app/controllers/concerns/current_user_concern.rb
module CurrentUserConcern
    extend ActiveSupport::Concern
  
    included do
      before_action :authenticate_request
    end
  
    private
  
    def authenticate_request
      token = request.headers['Authorization'].split(' ').last if request.headers['Authorization'].present?
      decoded_token = JsonWebToken.decode(token)
        byebug
      if decoded_token && decoded_token[:sub]
        @current_user = User.find_by(id: decoded_token[:sub])
      else
        render json: { errors: ['Not Authenticated'] }, status: :unauthorized
      end
    end
  
    def current_user
      @current_user
    end
  end
  