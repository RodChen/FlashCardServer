class Api::V1::UsersController < Api::ApiController

  def signup
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.json { render json: @user, status: :created }
      else
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def login
    user = User.find_by(email: user_params[:email].downcase)
    if user && user.authenticate(user_params[:password])
      render json: Api::V1::UserSerializer.new(user, root: false).to_json,
        status: 201      
    else
      render json: user.errors, status: :unauthorized
    end
  end

# NOT READY
  def logout
    user = User.find_by(email: user_params[:email].downcase)
    if user && user.authenticate(user_params[:password])
      user.update(password: user.password, api_key: nil)
      head status: :ok      
    else
      head status: :unauthorized
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email, :name, :password)
    end
end
