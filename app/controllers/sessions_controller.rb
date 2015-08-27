class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
    # debugger
    # if user && user.authenticate(session_params[:password])
      # Log the user in and redirect to the user's show page.
      log_in user
      redirect_to user

      flash.now[:notice] = 'login successfully'
    else
      # Create an error message.
      flash.now[:danger] = 'Invalid email / password combination' # Not quite right!
      render 'new'
    end
  end

  def destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # def set_user
    #   @user = User.find(params[:id])
    # end

    # Never trust parameters from the scary internet, only allow the white list through.
    # def session_params
    #   params.require(:session).permit(:email, :password)
    # end
end
