class Api::ApiController < ApplicationController
  # authentication and other filters implementation

  private
    # def authenticate
    #   authenticate_or_request_with_http_token do |token, options|
    #     @user = User.where(api_key: token).first
    #   end
    # end

    def authenticate
      api_key = request.headers['Api-Key']
      @user = User.where(api_key: api_key).first if api_key
      unless @user
        head status: :unauthorized
        return false
      end
      return true
    end
end
